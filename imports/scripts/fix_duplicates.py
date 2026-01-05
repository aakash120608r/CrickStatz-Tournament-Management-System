#!/usr/bin/env python3
import re
from collections import defaultdict
import shutil

SQL_PATH = 'imports/sample_data.sql'
BACKUP_PATH = 'imports/sample_data.sql.bak'


def remove_comments(sql_text):
    sql_text = re.sub(r"/\*.*?\*/", "", sql_text, flags=re.S)
    sql_text = re.sub(r"--.*?$", "", sql_text, flags=re.M)
    return sql_text


def find_statement_end(txt, start):
    i = start
    depth = 0
    in_sq = False
    in_dq = False
    while i < len(txt):
        c = txt[i]
        if c == "'" and not in_dq:
            if in_sq and i + 1 < len(txt) and txt[i+1] == "'":
                i += 2
                continue
            in_sq = not in_sq
            i += 1
            continue
        if c == '"' and not in_sq:
            in_dq = not in_dq
            i += 1
            continue
        if in_sq or in_dq:
            i += 1
            continue
        if c == '(':
            depth += 1
        elif c == ')':
            if depth > 0:
                depth -= 1
        elif c == ';' and depth == 0:
            return i
        i += 1
    return -1


def parse_insert_block(txt, table_name):
    # finds INSERT INTO table_name (...) VALUES ...;
    m = re.search(rf"INSERT\s+INTO\s+{table_name}\s*\(([^)]*)\)\s*VALUES", txt, re.I)
    if not m:
        return None
    cols = [c.strip() for c in m.group(1).split(',')]
    start = m.end()
    end = find_statement_end(txt, start)
    block = txt[m.start(): end+1 if end!=-1 else len(txt)]
    vals_block = txt[start:end]
    # extract top-level tuples
    tuples = []
    i = 0
    n = len(vals_block)
    while i < n:
        if vals_block[i] != '(':
            i += 1
            continue
        depth = 0
        j = i
        in_sq = False
        while j < n:
            ch = vals_block[j]
            if ch == "'":
                if in_sq and j + 1 < n and vals_block[j+1] == "'":
                    j += 2
                    continue
                in_sq = not in_sq
                j += 1
                continue
            if in_sq:
                j += 1
                continue
            if ch == '(':
                depth += 1
            elif ch == ')':
                depth -= 1
                if depth == 0:
                    break
            j += 1
        if j >= n:
            break
        t = vals_block[i:j+1]
        tuples.append(t)
        i = j + 1

    return m.start(), end+1 if end!=-1 else len(txt), cols, tuples


def split_tuple(inner):
    # inner without outer parentheses
    parts = []
    cur = ''
    i = 0
    n = len(inner)
    in_sq = False
    while i < n:
        c = inner[i]
        if c == "'":
            cur += c
            i += 1
            while i < n:
                cur += inner[i]
                if inner[i] == "'":
                    if i + 1 < n and inner[i+1] == "'":
                        cur += inner[i+1]
                        i += 2
                        continue
                    else:
                        i += 1
                        break
                i += 1
        elif c == ',' and not in_sq:
            parts.append(cur.strip())
            cur = ''
            i += 1
        else:
            cur += c
            i += 1
    if cur.strip():
        parts.append(cur.strip())
    return parts


def normalize_value(p):
    p = p.strip()
    if p.startswith("'") and p.endswith("'"):
        return p[1:-1].replace("''","'")
    if p.upper() == 'NULL':
        return None
    try:
        if '.' in p:
            return float(p)
        return int(p)
    except Exception:
        return p


def tuple_to_values(t):
    inner = t[1:-1]
    parts = split_tuple(inner)
    vals = [normalize_value(p) for p in parts]
    return vals


def build_tuple(vals):
    parts = []
    for v in vals:
        if v is None:
            parts.append('NULL')
        elif isinstance(v, str):
            parts.append("'" + v.replace("'","''") + "'")
        else:
            parts.append(str(v))
    return '(' + ', '.join(parts) + ')'


def main():
    print('Backing up', SQL_PATH, '->', BACKUP_PATH)
    shutil.copyfile(SQL_PATH, BACKUP_PATH)
    with open(SQL_PATH, 'r', encoding='utf-8') as f:
        txt = f.read()

    txt_nocom = remove_comments(txt)

    # parse players block
    res = parse_insert_block(txt, 'players')
    if not res:
        print('players insert not found')
        return
    p_start, p_end, p_cols, p_tuples = res
    players = []
    id_to_row = {}
    name_map = defaultdict(list)
    for t in p_tuples:
        vals = tuple_to_values(t)
        if not vals:
            print('Skipping empty tuple in players block')
            continue
        pid = vals[0]
        # find name column index robustly (case-insensitive)
        name_idx = None
        for i, c in enumerate(p_cols):
            if c.strip().lower() == 'name':
                name_idx = i
                break
        if name_idx is None:
            print('Could not find "name" column in players columns:', p_cols)
            return
        if len(vals) <= name_idx:
            print('Skipping malformed player tuple (not enough columns):', t)
            continue
        name = vals[name_idx]
        id_to_row[pid] = (vals, t)
        name_map[name].append(pid)
        players.append((pid, vals))

    # build id mapping for duplicates: map duplicate ids to canonical (min id)
    id_map = {}
    for name, ids in name_map.items():
        if len(ids) > 1:
            ids_sorted = sorted(ids)
            canon = ids_sorted[0]
            for dup in ids_sorted[1:]:
                id_map[dup] = canon
    if not id_map:
        print('No duplicate player names found.')
    else:
        print('Found duplicate player ids mapping examples (showing up to 20):')
        for i, (k, v) in enumerate(id_map.items()):
            if i >= 20: break
            print('  ', k, '->', v)

    # replace references in other tables: team_players, batting_stats, bowling_stats, fielding_stats, player_match_stats
    tables_to_fix = ['team_players','batting_stats','bowling_stats','fielding_stats','player_match_stats']
    replacements = {}
    for table in tables_to_fix:
        res = parse_insert_block(txt, table)
        if not res:
            continue
        s,e,cols,tuples = res
        new_tuples = []
        for t in tuples:
            vals = tuple_to_values(t)
            if table == 'team_players':
                # player_id is second column
                if len(vals) >=2 and vals[1] in id_map:
                    vals[1] = id_map[vals[1]]
            elif table in ('batting_stats','bowling_stats','fielding_stats'):
                # first col player_id
                if len(vals) >=1 and vals[0] in id_map:
                    vals[0] = id_map[vals[0]]
            elif table == 'player_match_stats':
                # match_id, player_id
                if len(vals) >=2 and vals[1] in id_map:
                    vals[1] = id_map[vals[1]]
            new_tuples.append((cols, vals))

        # for player_match_stats, merge duplicate (match_id, player_id)
        if table == 'player_match_stats':
            grouped = {}
            for cols_local, vals in new_tuples:
                if len(vals) < 2:
                    # malformed row
                    continue
                key = (vals[0], vals[1])
                if key not in grouped:
                    grouped[key] = list(vals)
                else:
                    base = grouped[key]
                    # sum numeric stats from index 2 onwards where possible
                    for i in range(2, max(len(base), len(vals))):
                        a = base[i] if i < len(base) else None
                        b = vals[i] if i < len(vals) else None
                        if a is None:
                            if i < len(base):
                                base[i] = b
                            else:
                                base.append(b)
                        elif b is None:
                            continue
                        else:
                            try:
                                base[i] = (a or 0) + (b or 0)
                            except Exception:
                                base[i] = b
                    grouped[key] = base
            final = []
            for key, vals in grouped.items():
                final.append((cols, vals))
            # replace in text
            new_block = 'INSERT INTO ' + table + ' (' + ', '.join(cols) + ')\nVALUES\n'
            new_block += ',\n'.join([build_tuple(vals) for cols, vals in final]) + ';'
            txt = txt[:s] + new_block + txt[e:]
        else:
            # rebuild block with updated ids
            new_block = 'INSERT INTO ' + table + ' (' + ', '.join(cols) + ')\nVALUES\n'
            new_block += ',\n'.join([build_tuple(vals) for cols, vals in new_tuples]) + ';'
            txt = txt[:s] + new_block + txt[e:]

    # remove duplicate player INSERT rows: keep canonical ids only
    if id_map:
        kept = set()
        final_players = []
        for pid, vals in sorted(players, key=lambda x: x[0]):
            if pid in id_map:
                # duplicate, skip
                continue
            final_players.append((pid, vals))
        # rebuild players block
        new_block = 'INSERT INTO players (' + ', '.join(p_cols) + ')\nVALUES\n'
        new_block += ',\n'.join([build_tuple(vals) for pid, vals in final_players]) + ';'
        txt = txt[:p_start] + new_block + txt[p_end:]

    # write back
    with open(SQL_PATH, 'w', encoding='utf-8') as f:
        f.write(txt)

    print('Wrote fixed SQL to', SQL_PATH)


if __name__ == '__main__':
    main()
