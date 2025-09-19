import mysql.connector
from prettytable import PrettyTable
import os
import csv
from colorama import Fore, Back, Style, init
import pyfiglet

init(autoreset=True)

print(Fore.BLUE + pyfiglet.figlet_format("CrickStatz"), Fore.CYAN + "Cricket Tournament Management System!",sep = '\n')
print()
print()

while True:
    try:
        print(Fore.YELLOW + Style.BRIGHT + "=== DATABASE CONNECTION ===")
        print(Fore.WHITE + "Please enter your MySQL credentials to connect to the database.")
        print()
        username = input(Fore.WHITE + "Enter MySQL username: " + Fore.WHITE)
        password = input(Fore.WHITE + "Enter MySQL password: " + Fore.WHITE)
        port_input = input(Fore.WHITE + 'Enter port (Default 3306): ' + Fore.WHITE)
        port = int(port_input) if port_input else 3306

        conn = mysql.connector.connect(
            host='localhost',
            user=username,
            password=password,
            port=port,
            auth_plugin='mysql_native_password'
            )
        if conn.is_connected():
            print(Fore.GREEN + Style.BRIGHT + "✅ Connected to CrickStatz database successfully.")
            print()
            break
        else:
            print(Fore.RED + Style.BRIGHT + "❌ Failed to connect to the database.")
            print(Fore.RED + "Please check your credentials and try again.")
            print()
            continue

    except mysql.connector.Error as err:
        print(Fore.RED + Style.BRIGHT + "❌ Failed to connect to the database.")
        print(Fore.RED + f"Error: {err}")
        print(Fore.RED + "Please check your credentials and try again.")
        print()
        continue

cursor=conn.cursor()

print()
print(Fore.YELLOW + "Initializing database tables...")

with open("database.sql", "r") as f:
    sql_file = f.read()

for statement in sql_file.split(';'):
    statement = statement.strip()
    if statement:
        try:
            cursor.execute(statement)
        except Exception as e:
            print(Fore.RED + f"Error executing: {statement}\n{e}")
            print()
print(Fore.GREEN + "Database initialization complete!")
print()

#input validation functions
def get_int(prompt, default=None, allow_empty=False):
    while True:
        v = input(prompt).strip()
        if v == '' and allow_empty:
            return default
        try:
            return int(v)
        except ValueError:
            print(Fore.RED + "Please enter a valid integer.")

def get_float(prompt, default=None, allow_empty=False):
    while True:
        v = input(prompt).strip()
        if v == '' and allow_empty:
            return default
        try:
            return float(v)
        except ValueError:
            print(Fore.RED + "Please enter a valid number.")

#enum input validation
def choose_enum(prompt, allowed):
    while True:
        v = input(prompt).strip().capitalize()
        if v in allowed:
            return v
        print(Fore.RED + f"Invalid. Choose one of: {', '.join(allowed)}")


#add records functions
def add_team():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- ADD TEAM ---")

    team_name = input(Fore.WHITE + "Enter team name: " + Fore.WHITE)
    captain_name = input(Fore.WHITE + "Enter captain name: " + Fore.WHITE)
    coach_name = input(Fore.WHITE + "Enter coach name: " + Fore.WHITE)
    home_ground = input(Fore.WHITE + "Enter home ground: " + Fore.WHITE)
    
    try:
        query = "INSERT INTO teams (name, captain, coach, home_ground) VALUES (%s, %s, %s, %s)"
        cursor.execute(query, (team_name, captain_name, coach_name, home_ground))
        conn.commit()

        print(Fore.GREEN + Style.BRIGHT + "✅ Team added successfully!")
        print(Fore.GREEN + f"Team ID: {cursor.lastrowid}")

    except mysql.connector.Error as err:
        conn.rollback()
        print(Fore.RED + Style.BRIGHT + f"❌ Error: {err}")

    print()

def add_player():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- ADD PLAYER ---")

    player_name = input(Fore.WHITE + "Enter player name: " + Fore.WHITE)
    age = get_int(Fore.WHITE + "Enter player age: " + Fore.WHITE)
    role = choose_enum(Fore.WHITE + "Enter player role (Batsman/Bowler/All-rounder/Wicketkeeper): " + Fore.WHITE, ['Batsman','Bowler','All-rounder','Wicketkeeper'])
    batting_style = input(Fore.WHITE + "Enter batting style (Right-hand/Left-hand): " + Fore.WHITE)
    bowling_style = input(Fore.WHITE + "Enter bowling style (Right-arm/Left-arm/None): " + Fore.WHITE)


    try:
        query= "INSERT INTO players (name, age, role, batting_style, bowling_style) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(query, (player_name, age, role, batting_style, bowling_style))
        conn.commit()
    
        print(Fore.GREEN + Style.BRIGHT + "✅ Player added successfully!")
        print(Fore.GREEN + f"Player ID: {cursor.lastrowid}")

    except mysql.connector.Error as err:
        conn.rollback()
        print(Fore.RED + Style.BRIGHT + f"❌ Error: {err}")

    print()

def add_venue():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- ADD VENUE ---")

    venue_name = input(Fore.WHITE + "Enter venue name: " + Fore.WHITE)
    location = input(Fore.WHITE + "Enter location: " + Fore.WHITE)
    capacity = get_int(Fore.WHITE + "Enter capacity: " + Fore.WHITE)

    try:
        query = "INSERT INTO venues (name, location, capacity) VALUES (%s, %s, %s)"
        cursor.execute(query, (venue_name, location, capacity))
        conn.commit()
        print(Fore.GREEN + Style.BRIGHT + "✅ Venue added successfully!")
        print(Fore.GREEN + f"Venue ID: {cursor.lastrowid}")

    except mysql.connector.Error as err:
        conn.rollback()
        print(Fore.RED + Style.BRIGHT + f"❌ Error: {err}")

    print()

def add_umpire():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- ADD UMPIRE ---")

    umpire_name = input(Fore.WHITE + "Enter umpire name: " + Fore.WHITE)
    experience_years = get_int(Fore.WHITE + "Enter years of experience: " + Fore.WHITE)

    try:
        query = "INSERT INTO umpires (name, experience) VALUES (%s, %s)"
        cursor.execute(query, (umpire_name, experience_years))
        conn.commit()

        print(Fore.GREEN + Style.BRIGHT + "✅ Umpire added successfully!")
        print(Fore.GREEN + f"Umpire ID: {cursor.lastrowid}")
 
    except mysql.connector.Error as err:
        conn.rollback()
        print(Fore.RED + Style.BRIGHT + f"❌ Error: {err}")

    print()

def add_player_to_team():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- ADD PLAYER TO TEAM ---")

    player_id = get_int(Fore.WHITE + "Enter player id: " + Fore.WHITE)
    team_id = get_int(Fore.WHITE + "Enter team id: " + Fore.WHITE)
    contract_start = input(Fore.WHITE + "Enter contract start date (YYYY-MM-DD): " + Fore.WHITE)
    contract_end = input(Fore.WHITE + "Enter contract end date (YYYY-MM-DD): " + Fore.WHITE)

    try:
        query = "INSERT INTO team_players (team_id, player_id, contract_start, contract_end) VALUES(%s, %s, %s, %s)"
        cursor.execute(query, (team_id, player_id, contract_start, contract_end))
        conn.commit()

        print(Fore.GREEN + Style.BRIGHT + "✅ Player added to Team successfully!")

    except mysql.connector.Error as err:
        conn.rollback()
        print(Fore.RED + Style.BRIGHT + f"❌ Error: {err}")

    print()

def add_matches():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- ADD MATCH ---")

    team1_id = get_int(Fore.WHITE + "Enter Team 1 ID: " + Fore.WHITE)
    team2_id = get_int(Fore.WHITE + "Enter Team 2 ID: " + Fore.WHITE)
    venue_id = get_int(Fore.WHITE + "Enter Venue ID: " + Fore.WHITE)
    umpire_id = get_int(Fore.WHITE + "Enter Umpire ID: " + Fore.WHITE)
    date = input(Fore.WHITE + "Enter match date (YYYY-MM-DD): " + Fore.WHITE)
    toss_winner = get_int(Fore.WHITE + "Enter Toss Winner Team ID: " + Fore.WHITE)
    toss_decision = choose_enum(Fore.WHITE + "Enter Toss Decision (Bat/Bowl): " + Fore.WHITE, ['Bat','Bowl'])
    team_1_score = get_int(Fore.WHITE + "Enter Team 1 Score: " + Fore.WHITE)
    team_2_score = get_int(Fore.WHITE + "Enter Team 2 Score: " + Fore.WHITE)
    team_1_wickets = get_int(Fore.WHITE + "Enter Team 1 Wickets Lost: " + Fore.WHITE)
    team_2_wickets = get_int(Fore.WHITE + "Enter Team 2 Wickets Lost: " + Fore.WHITE)
    match_result = input(Fore.WHITE + "Enter Match Result (Team 1/Team 2/Draw & By _ Runs/Wickets): " + Fore.WHITE)
    weather = input(Fore.WHITE + "Enter Weather Conditions: " + Fore.WHITE)

    if team1_id == team2_id:
        print(Fore.RED + Style.BRIGHT + "❌ Error: A team cannot play against itself.")
        return

    try:
        query = """INSERT INTO matches (team1_id, team2_id, venue_id, umpire_id, date, toss_winner, toss_decision, team_1_score, team_2_score, team_1_wickets, team_2_wickets, match_result, weather) 
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
        cursor.execute(query, (team1_id, team2_id, venue_id, umpire_id, date, toss_winner, toss_decision, team_1_score, team_2_score, team_1_wickets, team_2_wickets, match_result, weather))
        conn.commit()

        print(Fore.GREEN + Style.BRIGHT + "✅ Match added successfully!")
        print(Fore.GREEN + f"Match ID: {cursor.lastrowid}")

    except mysql.connector.Error as err:
        conn.rollback()
        print(Fore.RED + Style.BRIGHT + f"❌ Error: {err}")

    print()

def add_player_stats():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- ADD PLAYER STATS ---")

    player_id = get_int(Fore.WHITE + "Enter Player ID: " + Fore.WHITE)
    match_id = get_int(Fore.WHITE + "Enter Match ID: " + Fore.WHITE)

    # batting stats
    print(Fore.CYAN + "\n--- BATTING STATS ---")
    runs_scored = get_int(Fore.WHITE + "Enter Runs Scored: " + Fore.WHITE, allow_empty=True, default=0)
    balls_faced = get_int(Fore.WHITE + "Enter Balls Faced: " + Fore.WHITE, allow_empty=True, default=0)
    fours = get_int(Fore.WHITE + "Enter Number of Fours: " + Fore.WHITE, allow_empty=True, default=0)
    sixes = get_int(Fore.WHITE + "Enter Number of Sixes: " + Fore.WHITE, allow_empty=True, default=0)

    # bowling stats
    print(Fore.CYAN + "\n--- BOWLING STATS ---")
    overs_bowled = get_float(Fore.WHITE + "Enter Overs Bowled: " + Fore.WHITE, allow_empty=True, default=0.0)
    runs_conceded = get_int(Fore.WHITE + "Enter Runs Conceded: " + Fore.WHITE, allow_empty=True, default=0)
    wickets = get_int(Fore.WHITE + "Enter Wickets Taken: " + Fore.WHITE, allow_empty=True, default=0)

    # fielding stats
    print(Fore.CYAN + "\n--- FIELDING STATS ---")
    catches = get_int(Fore.WHITE + "Enter No.of Catches Taken: " + Fore.WHITE, allow_empty=True, default=0)
    run_outs = get_int(Fore.WHITE + "Enter No.of Run Outs Made: " + Fore.WHITE, allow_empty=True, default=0)
    stumpings = get_int(Fore.WHITE + "Enter No.of Stumpings Made: " + Fore.WHITE, allow_empty=True, default=0)

    matches_played = 1
    fifties = 1 if 50 <= runs_scored < 100 else 0
    hundreds = 1 if runs_scored >= 100 else 0

    try:
        conn.start_transaction()

        # Insert into player_match_stats
        cursor.execute("""
            INSERT INTO player_match_stats 
            (player_id, match_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings) 
            VALUES (%s , %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (player_id, match_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, catches, run_outs, stumpings))

        # Update batting stats
        cursor.execute("""
            INSERT INTO batting_stats (player_id, matches_played, runs_scored, balls_faced, fours, sixes, fifties, hundreds)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                matches_played = matches_played + VALUES(matches_played),
                runs_scored = runs_scored + VALUES(runs_scored),
                balls_faced = balls_faced + VALUES(balls_faced),
                fours = fours + VALUES(fours),
                sixes = sixes + VALUES(sixes),
                fifties = fifties + VALUES(fifties),
                hundreds = hundreds + VALUES(hundreds)
        """, (player_id, matches_played, runs_scored, balls_faced, fours, sixes, fifties, hundreds))

        # Update bowling stats
        cursor.execute("""
            INSERT INTO bowling_stats (player_id, matches_played, overs_bowled, runs_conceded, wickets)
            VALUES (%s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                matches_played = matches_played + VALUES(matches_played),
                overs_bowled = overs_bowled + VALUES(overs_bowled),
                runs_conceded = runs_conceded + VALUES(runs_conceded),
                wickets = wickets + VALUES(wickets)
        """, (player_id, matches_played, overs_bowled, runs_conceded, wickets))

        # Update fielding stats
        cursor.execute("""
            INSERT INTO fielding_stats (player_id, matches_played, catches, run_outs, stumpings)
            VALUES (%s, %s, %s, %s, %s)
            ON DUPLICATE KEY UPDATE
                matches_played = matches_played + VALUES(matches_played),
                catches = catches + VALUES(catches),
                run_outs = run_outs + VALUES(run_outs),
                stumpings = stumpings + VALUES(stumpings)
        """, (player_id, matches_played, catches, run_outs, stumpings))

        conn.commit()
        print(Fore.GREEN + Style.BRIGHT + "✅ Player stats added and cumulative stats updated successfully!")

    except mysql.connector.Error as err:
        conn.rollback()
        print(Fore.RED + Style.BRIGHT + f"❌ Error: {err}")

    print()

# view records functions
def view_all_teams():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- TEAMS ---")
    cursor.execute('SELECT * FROM teams')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Captain', 'Coach', 'Home Ground'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_team():
    team_id = get_int('Enter Team ID to view: ')
    cursor.execute('SELECT * FROM teams WHERE team_id = %s',(team_id,))
    team = cursor.fetchone()
    if not team:
        print(Fore.RED + "Team not found.\n")
        return

    print(Fore.YELLOW + Style.BRIGHT + f"\n--- TEAM DETAILS (ID: {team_id}) ---")
    print(f"Name: {team[1]}")
    print(f"Captain: {team[2]}")
    print(f"Coach: {team[3]}")
    print(f"Home Ground: {team[4]}")

    # Fetch and display players in the team
    cursor.execute("""
        SELECT p.player_id, p.name, p.age, p.role, p.batting_style, p.bowling_style
        FROM players p
        JOIN team_players tp ON p.player_id = tp.player_id
        WHERE tp.team_id = %s
    """, (team_id,))
    players = cursor.fetchall()

    if players:
        print(Fore.CYAN + "\n--- PLAYERS IN TEAM ---")
        player_table = PrettyTable(['ID', 'Name', 'Age', 'Role', 'Batting Style', 'Bowling Style'])
        for player in players:
            player_table.add_row(player)
        print(player_table)
    else:
        print(Fore.YELLOW + "No players found in this team.")

    print()

def view_all_players():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- PLAYERS ---")
    cursor.execute('SELECT * FROM players')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Age', 'Role', 'Batting Style', 'Bowling Style'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_player():
    player_id = get_int('Enter Player ID to view: ')
    cursor.execute('SELECT * FROM players WHERE player_id = %s', (player_id,))
    player = cursor.fetchone()
    if not player:
        print(Fore.RED + "Player not found.\n")
        return

    print(Fore.YELLOW + Style.BRIGHT + f"\n--- PLAYER DETAILS (ID: {player_id}) ---")
    print(f"Name: {player[1]}")
    print(f"Age: {player[2]}")
    print(f"Role: {player[3]}")
    print(f"Batting Style: {player[4]}")
    print(f"Bowling Style: {player[5]}")

    # Fetch and display teams the player has played for
    cursor.execute("""
        SELECT t.team_id, t.name, tp.contract_start, tp.contract_end
        FROM teams t
        JOIN team_players tp ON t.team_id = tp.team_id
        WHERE tp.player_id = %s
    """, (player_id,))
    teams = cursor.fetchall()

    if teams:
        print(Fore.CYAN + "\n--- TEAMS PLAYER HAS PLAYED FOR ---")
        team_table = PrettyTable(['Team ID', 'Team Name', 'Contract Start', 'Contract End'])
        for team in teams:
            team_table.add_row(team)
        print(team_table)
    else:
        print(Fore.YELLOW + "This player has not played for any team.")

    print()

def view_venues():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- VENUES ---")
    cursor.execute('SELECT * FROM venues')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Location', 'Capacity'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_umpires():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- UMPIRES ---")
    cursor.execute('SELECT * FROM umpires')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Experience (Years)'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_all_matches():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- MATCHES ---")
    cursor.execute('SELECT * FROM matches')
    rows = cursor.fetchall()
    table = PrettyTable(['Match ID', 'Team 1 ID', 'Team 2 ID', 'Venue ID', 'Umpire ID', 'Date', 'Toss Winner', 'Toss Decision', 'Team 1 Score', 'Team 2 Score', 'Team 1 Wickets', 'Team 2 Wickets', 'Match Result', 'Weather'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_match():
    match_id = get_int('Enter Match ID to view: ')
    cursor.execute('SELECT * FROM matches WHERE match_id = %s', (match_id,))
    match = cursor.fetchone()
    if not match:
        print(Fore.RED + "Match not found.\n")
        return

    print(Fore.YELLOW + Style.BRIGHT + f"\n--- MATCH DETAILS (ID: {match_id}) ---")
    
    cursor.execute('SELECT name FROM teams WHERE team_id = %s', (match[1],))
    team1_name = cursor.fetchone()[0]
    cursor.execute('SELECT name FROM teams WHERE team_id = %s', (match[2],))
    team2_name = cursor.fetchone()[0]
    cursor.execute('SELECT name FROM venues WHERE venue_id = %s', (match[3],))
    venue_name = cursor.fetchone()[0]
    cursor.execute('SELECT name FROM umpires WHERE umpire_id = %s', (match[4],))
    umpire_name = cursor.fetchone()[0]

    if team1_name or team2_name or venue_name or umpire_name is None:
        print(Fore.RED + "Error fetching related details. Some IDs may be invalid.")
        return

    print(f"Team 1: {team1_name} (ID: {match[1]})")
    print(f"Team 2: {team2_name} (ID: {match[2]})")
    print(f"Venue: {venue_name} (ID: {match[3]})")
    print(f"Umpire: {umpire_name} (ID: {match[4]})")
    print(f"Date: {match[5]}")
    print(f"Toss Winner: {'Team 1' if match[6] == match[1] else 'Team 2'} (ID: {match[6]})")
    print(f"Toss Decision: {match[7]}")
    print(f"Team 1 Score: {match[8]}/{match[10]}")
    print(f"Team 2 Score: {match[9]}/{match[11]}")
    print(f"Match Result: {match[12]}")
    print(f"Weather: {match[13]}")

    print()

def view_all_batting_stats():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- BATTING STATS ---")
    cursor.execute('SELECT * FROM batting_stats')
    rows = cursor.fetchall()
    table = PrettyTable(['Player ID', 'Matches Played', 'Runs Scored', 'Balls Faced', 'Strike Rate', 'Fours', 'Sixes', 'Fifties', 'Hundreds'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_batting_stats():
    player_id = get_int('Enter Player ID to view batting stats: ')
    cursor.execute('SELECT * FROM batting_stats WHERE player_id = %s', (player_id,))
    stats = cursor.fetchone()
    if not stats:
        print(Fore.RED + "Batting stats not found for this player.\n")
        return

    print(Fore.YELLOW + Style.BRIGHT + f"\n--- BATTING STATS (Player ID: {player_id}) ---")
    print(f"Matches Played: {stats[1]}")
    print(f"Runs Scored: {stats[2]}")
    print(f"Balls Faced: {stats[3]}")
    print(f"Strike Rate: {stats[4]:.2f}")
    print(f"Fours: {stats[5]}")
    print(f"Sixes: {stats[6]}")
    print(f"Fifties: {stats[7]}")
    print(f"Hundreds: {stats[8]}")

    print()

def view_all_bowling_stats():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- BOWLING STATS ---")
    cursor.execute('SELECT * FROM bowling_stats')
    rows = cursor.fetchall()
    table = PrettyTable(['Player ID', 'Matches Played', 'Overs Bowled', 'Runs Conceded', 'Economy', 'Wickets Taken'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_bowling_stats():
    player_id = get_int('Enter Player ID to view bowling stats: ')
    cursor.execute('SELECT * FROM bowling_stats WHERE player_id = %s', (player_id,))
    stats = cursor.fetchone()
    if not stats:
        print(Fore.RED + "Bowling stats not found for this player.\n")
        return

    print(Fore.YELLOW + Style.BRIGHT + f"\n--- BOWLING STATS (Player ID: {player_id}) ---")
    print(f"Matches Played: {stats[1]}")
    print(f"Overs Bowled: {stats[2]}")
    print(f"Runs Conceded: {stats[3]}")
    print(f"Economy Rate: {stats[4]:.2f}")
    print(f"Wickets Taken: {stats[5]}")

    print()

def view_all_fielding_stats():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- FIELDING STATS ---")
    cursor.execute('SELECT * FROM fielding_stats')
    rows = cursor.fetchall()
    table = PrettyTable(['Player ID', 'Matches Played', 'Catches', 'Run Outs', 'Stumpings'])
    for row in rows:    
        table.add_row(row)
    print(table)

    print()

def view_fielding_stats():
    player_id = get_int('Enter Player ID to view fielding stats: ')
    cursor.execute('SELECT * FROM fielding_stats WHERE player_id = %s', (player_id,))
    stats = cursor.fetchone()
    if not stats:
        print(Fore.RED + "Fielding stats not found for this player.\n")
        return

    print(Fore.YELLOW + Style.BRIGHT + f"\n--- FIELDING STATS (Player ID: {player_id}) ---")
    print(f"Matches Played: {stats[1]}")
    print(f"Catches: {stats[2]}")
    print(f"Run Outs: {stats[3]}")
    print(f"Stumpings: {stats[4]}")

    print()

def view_player_match_stats():
    print(Fore.YELLOW + Style.BRIGHT + "\n--- VIEW PLAYER MATCH STATS ---")
    choice = get_int('View by (1) Player ID, (2) Match ID, (3) Both Player & Match ID (1/2/3): ')
    if choice == 1:
        player_id = get_int('Enter Player ID to view match stats: ')
        cursor.execute('SELECT * FROM player_match_stats WHERE player_id = %s', (player_id,))
        rows = cursor.fetchall()
        if not rows:
            print(Fore.RED + "No match stats found for this player.\n")
            return
        print(Fore.YELLOW + Style.BRIGHT + f"\n--- PLAYER MATCH STATS (Player ID: {player_id}) ---")
        table = PrettyTable(['Match ID', 'Runs Scored', 'Balls Faced', 'Fours', 'Sixes', 'Wickets', 'Overs Bowled', 'Runs Conceded', 'Catches', 'Run Outs', 'Stumpings'])
        for row in rows:
            table.add_row([row[0]] + list(row[2:]))
        print(table)

    elif choice == 2:
        match_id = get_int('Enter Match ID to view player stats: ')
        cursor.execute('SELECT * FROM player_match_stats WHERE match_id = %s', (match_id,))
        rows = cursor.fetchall()
        if not rows:
            print(Fore.RED + "No player stats found for this match.\n")
            return
        print(Fore.YELLOW + Style.BRIGHT + f"\n--- PLAYER MATCH STATS (Match ID: {match_id}) ---")
        table = PrettyTable(['Player ID', 'Runs Scored', 'Balls Faced', 'Fours', 'Sixes', 'Wickets', 'Overs Bowled', 'Runs Conceded', 'Catches', 'Run Outs', 'Stumpings'])
        for row in rows:
            table.add_row([row[1]] + list(row[2:]))
        print(table)

    elif choice == 3:
        player_id = get_int('Enter Player ID: ')
        match_id = get_int('Enter Match ID: ')
        cursor.execute('SELECT * FROM player_match_stats WHERE player_id = %s AND match_id = %s', (player_id, match_id))
        stats = cursor.fetchone()
        if not stats:
            print(Fore.RED + "No stats found for this player in this match.\n")
            return
        print(Fore.YELLOW + Style.BRIGHT + f"\n--- PLAYER MATCH STATS (Player ID: {player_id}, Match ID: {match_id}) ---")

        print(f"Runs Scored: {stats[2]}")
        print(f"Balls Faced: {stats[3]}")
        print(f"Fours: {stats[4]}")
        print(f"Sixes: {stats[5]}")
        print(f"Wickets: {stats[6]}")
        print(f"Overs Bowled: {stats[7]}")
        print(f"Runs Conceded: {stats[8]}")
        print(f"Catches: {stats[9]}")
        print(f"Run Outs: {stats[10]}")
        print(f"Stumpings: {stats[11]}")

    else:
        print(Fore.RED + "Invalid choice.\n")
        return
    
    print()

# data export to CSV
def export_data(table_name):
    print(Fore.YELLOW + f"\n--- EXPORTING {table_name.upper()} ---")
    
    try:
        cursor.execute(f"SELECT * FROM {table_name}")
        rows = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]

        os.makedirs('exports', exist_ok=True)
        filename = os.path.join('exports', f"{table_name}.csv")
        with open(filename, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(columns)
            writer.writerows(rows)

        print(Fore.GREEN + Style.BRIGHT + f"✅ Data exported successfully to {filename}")

    except mysql.connector.Error as err:
        print(Fore.RED + Style.BRIGHT + f"❌ Database Error: {err}")
    except Exception as e:
        print(Fore.RED + Style.BRIGHT + f"❌ Unexpected error: {e}")

    print()

# score predictions
def predict_player_score():
    player_id = get_int('Enter Player ID to predict next match score: ')
    num_matches = input("Enter number of recent matches to consider (default 5): ")
    num_matches = int(num_matches) if num_matches else 5

    cursor.execute("""
        SELECT runs_scored 
        FROM player_match_stats
        WHERE player_id = %s
        ORDER BY match_id DESC
        LIMIT %s
    """, (player_id, num_matches))
    rows = cursor.fetchall()

    if not rows:
        print("No match data found for this player.\n")
        return

    scores = [row[0] for row in rows]

    # Weighted average (recent matches count more)
    weights = list(range(len(scores), 0, -1))
    weighted_avg = sum(s * w for s, w in zip(scores, weights)) / sum(weights)


    print(f"Predicted runs for Player ID {player_id} in next match (based on last {len(scores)} matches): {weighted_avg:.2f}")

    print()

def predict_team_score():
    team_id = get_int('Enter Team ID to predict next match score: ')
    num_matches = input("Enter number of recent matches to consider (default 5): ")
    num_matches = int(num_matches) if num_matches else 5

    cursor.execute("""
        SELECT team_1_score, team_1_wickets 
        FROM matches 
        WHERE team1_id = %s
        ORDER BY match_id DESC
        LIMIT %s
    """, (team_id, num_matches))
    rows1 = cursor.fetchall()

    cursor.execute("""
        SELECT team_2_score, team_2_wickets 
        FROM matches 
        WHERE team2_id = %s
        ORDER BY match_id DESC
        LIMIT %s
    """, (team_id, num_matches))
    rows2 = cursor.fetchall()

    rows = rows1 + rows2
    if not rows:
        print("No match data found for this team.\n")
        return

    scores = [r[0] for r in rows]
    wickets = [r[1] for r in rows]

    avg_runs = sum(scores) / len(scores)
    avg_wkts = sum(wickets) / len(wickets)

    print(f"Predicted team score for Team ID {team_id} in next match: {avg_runs:.2f}/{avg_wkts:.0f}")

    print()

#main menu
def main_menu():
    print()
    print(Fore.BLUE + Style.BRIGHT + "=" * 30)
    print(Fore.BLUE + Style.BRIGHT + "          MAIN MENU")
    print(Fore.BLUE + Style.BRIGHT + "=" * 30)
    print()
    print(Fore.CYAN + "1. Add Records")
    print(Fore.CYAN + "2. View Records")
    print(Fore.CYAN + "3. Export Data to CSV")
    print(Fore.CYAN + "4. Predict Scores")
    print(Fore.RED + "5. Exit")
    print()
    choice = input(Fore.WHITE + "Enter your choice (1-5): " + Fore.WHITE)
    print()

    if choice == '1':
        print(Fore.YELLOW + Style.BRIGHT + "--- ADD RECORDS ---")
        print()
        print(Fore.CYAN + "a. Add Team")
        print(Fore.CYAN + "b. Add Player")
        print(Fore.CYAN + "c. Add Venue")
        print(Fore.CYAN + "d. Add Umpire")
        print(Fore.CYAN + "e. Add Player to Team")
        print(Fore.CYAN + "f. Add Match")
        print(Fore.CYAN + "g. Add Player Stats")
        print()
        sub_choice = input(Fore.WHITE + "Enter your choice (a-g): " + Fore.WHITE).lower()

        if sub_choice == 'a':
            add_team()
        elif sub_choice == 'b':
            add_player()
        elif sub_choice == 'c':
            add_venue()
        elif sub_choice == 'd':
            add_umpire()
        elif sub_choice == 'e':
            add_player_to_team()
        elif sub_choice == 'f':
            add_matches()
        elif sub_choice == 'g':
            add_player_stats()
        else:
            print("Invalid choice. Please try again.")

    elif choice == '2':
        print(Fore.YELLOW + Style.BRIGHT + "--- VIEW RECORDS ---")
        print()
        print(Fore.CYAN + "a. View Teams")
        print(Fore.CYAN + "b. View Players")
        print(Fore.CYAN + "c. View Venues")
        print(Fore.CYAN + "d. View Umpires")
        print(Fore.CYAN + "e. View Matches")
        print(Fore.CYAN + "f. View Batting Stats")
        print(Fore.CYAN + "g. View Bowling Stats")
        print(Fore.CYAN + "h. View Fielding Stats")
        print(Fore.CYAN + "i. View Player Match Stats")
        print()
        sub_choice = input(Fore.WHITE + "Enter your choice (a-i): " + Fore.WHITE).lower()
        print()
        if sub_choice == 'a':
            team_choice = get_int("View (1) All Teams or (2) Specific Team by ID? (1/2): ")
            if team_choice == 1:
                view_all_teams()
            elif team_choice == 2:
                view_team()
            else:
                print(Fore.RED + "Invalid choice. Please try again.")
        elif sub_choice == 'b':
            player_choice = get_int("View (1) All Players or (2) Specific Player by ID? (1/2): ")
            if player_choice == 1:
                view_all_players()
            elif player_choice == 2:
                view_player()
            else:
                print(Fore.RED + "Invalid choice. Please try again.")
        elif sub_choice == 'c':
            view_venues()
        elif sub_choice == 'd':
            view_umpires()
        elif sub_choice == 'e':
            match_choice = get_int("View (1) All Matches or (2) Specific Match by ID? (1/2): ")
            if match_choice == 1:
                view_all_matches()
            elif match_choice == 2:
                view_match()
            else:
                print(Fore.RED + "Invalid choice. Please try again.")
        elif sub_choice == 'f':
            batting_choice = get_int("View (1) All Batting Stats or (2) Specific Player by ID? (1/2): ")
            if batting_choice == 1:
                view_all_batting_stats()
            elif batting_choice == 2:
                view_batting_stats()
            else:
                print(Fore.RED + "Invalid choice. Please try again.")
        elif sub_choice == 'g':
            bowling_choice = get_int("View (1) All Bowling Stats or (2) Specific Player by ID? (1/2): ")
            if bowling_choice == 1:
                view_all_bowling_stats()
            elif bowling_choice == 2:
                view_bowling_stats()
            else:
                print(Fore.RED + "Invalid choice. Please try again.")
        elif sub_choice == 'h':
            fielding_choice = get_int("View (1) All Fielding Stats or (2) Specific Player by ID? (1/2): ")
            if fielding_choice == 1:
                view_all_fielding_stats()
            elif fielding_choice == 2:
                view_fielding_stats()
            else:
                print(Fore.RED + "Invalid choice. Please try again.")
        elif sub_choice == 'i':
            view_player_match_stats()
        else:
            print(Fore.RED + "Invalid choice. Please try again.")

    elif choice == '3':
        print(Fore.YELLOW + Style.BRIGHT + "--- EXPORT DATA TO CSV ---")
        print()
        print(Fore.CYAN + "a. Export Teams")
        print(Fore.CYAN + "b. Export Players")
        print(Fore.CYAN + "c. Export Venues")
        print(Fore.CYAN + "d. Export Umpires")
        print(Fore.CYAN + "e. Export Matches")
        print(Fore.CYAN + "f. Export Batting Stats")
        print(Fore.CYAN + "g. Export Bowling Stats")
        print(Fore.CYAN + "h. Export Fielding Stats")
        print(Fore.CYAN + "i. Export Player Match Stats")
        print()
        sub_choice = input(Fore.WHITE + "Enter your choice (a-i): " + Fore.WHITE).lower()
        print()
        if sub_choice == 'a':
            export_data('teams')
        elif sub_choice == 'b':
            export_data('players')
        elif sub_choice == 'c':
            export_data('venues')
        elif sub_choice == 'd':
            export_data('umpires')
        elif sub_choice == 'e':
            export_data('matches')
        elif sub_choice == 'f':
            export_data('batting_stats')
        elif sub_choice == 'g':
            export_data('bowling_stats')
        elif sub_choice == 'h':
            export_data('fielding_stats')
        elif sub_choice == 'i':
            export_data('player_match_stats')
        else:
            print(Fore.RED + "Invalid choice. Please try again.")

    elif choice == '4':
        print(Fore.YELLOW + Style.BRIGHT + "--- PREDICT SCORES ---")
        print()
        print(Fore.CYAN + "a. Predict Player Score")
        print(Fore.CYAN + "b. Predict Team Score")
        print()
        sub_choice = input(Fore.WHITE + "Enter your choice (a-b): " + Fore.WHITE).lower()
        print()
        if sub_choice == 'a':
            predict_player_score()
        elif sub_choice == 'b':
            predict_team_score()
        else:
            print(Fore.RED + "Invalid choice. Please try again.")

    elif choice == '5':
        print(Fore.GREEN + Style.BRIGHT + "Thank you for using CrickStatz!")
        print(Fore.GREEN + "Exiting the program. Goodbye!")
        cursor.close()
        conn.close()
        exit()
    else:
        print(Fore.RED + "Invalid choice. Please try again.")

print(Fore.GREEN + Style.BRIGHT + "🏏 Welcome to CrickStatz - Cricket Tournament Management System!")
print(Fore.BLUE + "=" * 80)
while True:
    main_menu()
    print(Fore.BLUE + "=" * 80)

cursor.close()
conn.close()
exit()
