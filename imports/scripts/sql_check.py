#!/usr/bin/env python3
import re
from collections import defaultdict

SQL_FILE = 'imports/sample_data.sql'


def split_tuple(s):
    items = []
    cur = ''
    i = 0
    while i < len(s):
        c = s[i]
        if c == "'":
            cur += c
            i += 1
            while i < len(s):
                cur += s[i]
                if s[i] == "'":
                    if i + 1 < len(s) and s[i+1] == "'":
                        cur += s[i+1]
                        i += 2
                        continue
                    else:
                        i += 1
                        break
                i += 1
        elif c == ',' and not cur.endswith(')'):
            items.append(cur.strip())
            cur = ''
            i += 1
        else:
            cur += c
            i += 1
    if cur.strip():
        items.append(cur.strip())
    return items


def remove_comments(sql_text):
    # remove block comments
    sql_text = re.sub(r"/\*.*?\*/", "", sql_text, flags=re.S)
    # remove line comments
    sql_text = re.sub(r"--.*?$", "", sql_text, flags=re.M)
    return sql_text


def find_statement_end(txt, start):
    # find semicolon that's not inside quotes or parentheses
    i = start
    depth = 0
    in_sq = False
    in_dq = False
    while i < len(txt):
        c = txt[i]
        if c == "'" and not in_dq:
            # handle escaped '' inside single quotes
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


def parse_sql(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        txt = f.read()

    txt = remove_comments(txt)

    data = defaultdict(list)

    # find all INSERT INTO occurrences
    for m in re.finditer(r"INSERT\s+INTO\s+([a-zA-Z0-9_]+)\s*\(([^)]*)\)\s*VALUES", txt, re.I):
        table = m.group(1).lower()
        cols = [c.strip() for c in m.group(2).split(',')]
        vals_start = m.end()
        stmt_end = find_statement_end(txt, vals_start)
        if stmt_end == -1:
            vals_block = txt[vals_start:]
        else:
            vals_block = txt[vals_start:stmt_end]

        # extract tuples by scanning for top-level parentheses
        i = 0
        n = len(vals_block)
        while i < n:
            # skip until next '('
            if vals_block[i] != '(':
                i += 1
                continue
            depth = 0
            j = i
            in_sq = False
            while j < n:
                ch = vals_block[j]
                if ch == "'":
                    # handle escaped quotes
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
            inner = t[1:-1].strip()
            parts = split_tuple(inner)
            norm = []
            for p in parts:
                p = p.strip()
                if p.startswith("'") and p.endswith("'"):
                    norm.append(p[1:-1].replace("''", "'"))
                elif p == "":
                    norm.append(None)
                else:
                    try:
                        norm.append(int(p))
                    except Exception:
                        norm.append(p)
            data[table].append((cols, norm))
            i = j + 1

    return data


def collect_declared_ids(data):
    declared = {
        'players': set(),
        'teams': set(),
        'venues': set(),
        'umpires': set(),
        'matches': set()
    }
    # For players/teams/venues/umpires/matches we assume first column is id if present
    for table in ['players', 'teams', 'venues', 'umpires', 'matches']:
        for cols, vals in data.get(table, []):
            if len(cols) > 0 and len(vals) > 0:
                # first column value
                first = vals[0]
                if isinstance(first, int):
                    declared[table].add(first)
    return declared


def collect_references(data):
    refs = defaultdict(set)

    # team_players: cols (team_id, player_id,...)
    for cols, vals in data.get('team_players', []):
        if len(vals) >= 2:
            if isinstance(vals[0], int): refs['team_players.team_id'].add(vals[0])
            if isinstance(vals[1], int): refs['team_players.player_id'].add(vals[1])

    # matches: team1_id, team2_id, venue_id, umpire_id, toss_winner
    for cols, vals in data.get('matches', []):
        # try to map by column name
        col_map = {c: i for i, c in enumerate(cols)}
        def getcol(name):
            i = col_map.get(name)
            return vals[i] if i is not None and i < len(vals) else None
        for name in ['team1_id', 'team2_id', 'venue_id', 'umpire_id', 'toss_winner']:
            v = getcol(name)
            if isinstance(v, int): refs[f'matches.{name}'].add(v)

    # batting_stats, bowling_stats, fielding_stats: first col player_id
    for table in ['batting_stats', 'bowling_stats', 'fielding_stats']:
        for cols, vals in data.get(table, []):
            if len(vals) > 0 and isinstance(vals[0], int):
                refs[f'{table}.player_id'].add(vals[0])

    # player_match_stats: match_id, player_id
    for cols, vals in data.get('player_match_stats', []):
        if len(vals) >= 2:
            if isinstance(vals[0], int): refs['player_match_stats.match_id'].add(vals[0])
            if isinstance(vals[1], int): refs['player_match_stats.player_id'].add(vals[1])

    return refs


def report(declared, refs):
    problems = []
    # team refs
    if refs['team_players.team_id']:
        missing = sorted([x for x in refs['team_players.team_id'] if x not in declared['teams']])
        if missing:
            problems.append(('team_players.team_id', missing))
    if refs['team_players.player_id']:
        missing = sorted([x for x in refs['team_players.player_id'] if x not in declared['players']])
        if missing:
            problems.append(('team_players.player_id', missing))

    # matches refs
    for key in ['team1_id','team2_id','venue_id','umpire_id','toss_winner']:
        k = f'matches.{key}'
        if refs[k]:
            if key in ('team1_id','team2_id','toss_winner'):
                target = 'teams'
            elif 'venue' in key:
                target = 'venues'
            else:
                target = 'umpires'
            missing = sorted([x for x in refs[k] if x not in declared[target]])
            if missing:
                problems.append((k, missing))

    # stats
    for table in ['batting_stats','bowling_stats','fielding_stats']:
        key = f'{table}.player_id'
        if refs[key]:
            missing = sorted([x for x in refs[key] if x not in declared['players']])
            if missing:
                problems.append((key, missing))

    # player_match_stats
    if refs['player_match_stats.match_id']:
        missing = sorted([x for x in refs['player_match_stats.match_id'] if x not in declared['matches']])
        if missing:
            problems.append(('player_match_stats.match_id', missing))
    if refs['player_match_stats.player_id']:
        missing = sorted([x for x in refs['player_match_stats.player_id'] if x not in declared['players']])
        if missing:
            problems.append(('player_match_stats.player_id', missing))

    out_lines = []
    out_lines.append(f'Referential check report for {SQL_FILE}')
    out_lines.append('Declared counts:')
    for k, v in declared.items():
        out_lines.append(f'  {k}: {len(v)}')
    out_lines.append('\nReference checks:')
    if not problems:
        out_lines.append('  No missing references detected.')
    else:
        for where, vals in problems:
            out_lines.append(f'  MISSING in {where}: {vals}')

    # write human-readable report
    report_path = 'scripts/sql_check_report.txt'
    with open(report_path, 'w', encoding='utf-8') as rf:
        rf.write('\n'.join(out_lines) + '\n')

    # write CSV of missing refs
    import csv
    csv_path = 'scripts/missing_references.csv'
    with open(csv_path, 'w', newline='', encoding='utf-8') as cf:
        writer = csv.writer(cf)
        writer.writerow(['location','missing_ids'])
        for where, vals in problems:
            writer.writerow([where, ' '.join(map(str, vals))])

    # small note printed to stdout as well
    print(f'Wrote human report to {report_path} and CSV to {csv_path}')

    # Extra: detect duplicate player names
    # build name->ids map
    names = defaultdict(list)
    for cols, vals in data.get('players', []):
        # find index of 'name' column
        try:
            idx = cols.index('name')
        except ValueError:
            idx = 1 if len(cols) > 1 else None
        if idx is not None and idx < len(vals):
            name = vals[idx]
            pid = vals[0] if len(vals) > 0 else None
            names[name].append(pid)
    dups = {n: ids for n, ids in names.items() if len(ids) > 1}
    if dups:
        out_lines.append('\nDuplicate player names (same name, different ids):')
        for n, ids in dups.items():
            out_lines.append(f'  {n}: {ids}')
        dup_path = 'scripts/duplicate_player_names.csv'
        with open(dup_path, 'w', newline='', encoding='utf-8') as df:
            writer = csv.writer(df)
            writer.writerow(['player_name','ids'])
            for n, ids in dups.items():
                writer.writerow([n, ' '.join(map(str, ids))])
        print(f'Wrote duplicates CSV to {dup_path}')


if __name__ == '__main__':
    data = parse_sql(SQL_FILE)
    declared = collect_declared_ids(data)
    refs = collect_references(data)
    # compute problems (correct mapping for toss_winner -> teams)
    probs = []
    if refs['team_players.player_id']:
        missing = sorted([x for x in refs['team_players.player_id'] if x not in declared['players']])
        if missing:
            probs.append(('team_players.player_id', missing))
    for key in ['team1_id','team2_id','venue_id','umpire_id','toss_winner']:
        k = f'matches.{key}'
        if refs[k]:
            if key in ('team1_id','team2_id','toss_winner'):
                target = 'teams'
            elif 'venue' in key:
                target = 'venues'
            else:
                target = 'umpires'
            missing = sorted([x for x in refs[k] if x not in declared[target]])
            if missing:
                probs.append((k, missing))
    report(declared, refs)
