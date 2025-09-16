import mysql.connector
import pandas as pd
from prettytable import PrettyTable
import os

try:
    username = input("Enter MySQL username: ")
    password = input("Enter MySQL password: ")    
    port = int(input("Enter MySQL port number (default 3306): "))
    if not port:
        port = 3306

    conn = mysql.connector.connect(
        host='localhost',
        user=username,
        password=password,
        port=port,
        database='crickstatz',
        auth_plugin='mysql_native_password'
        )
    if conn.is_connected():
        print("Connected to CrickStatz database successfully.")
    else:
        print("Failed to connect to the database.")
except mysql.connector.Error as err:
    print(f"Error: {err}")

cursor=conn.cursor()

# Initializing the tables
with open("database.sql", "r") as f:
    sql_file = f.read()

for statement in sql_file.split(';'):
    statement = statement.strip()
    if statement:
        try:
            cursor.execute(statement)
        except Exception as e:
            print(f"Error executing: {statement}\n{e}")

print()

def add_team():
    team_name = input("Enter team name: ")
    captain_name = input("Enter captain name: ")
    coach_name = input("Enter coach name: ")
    home_ground = input("Enter home ground: ")
    
    try:
        query = "INSERT INTO teams (name, captain, coach, home_ground) VALUES (%s, %s, %s, %s)"
        cursor.execute(query, (team_name, captain_name, coach_name, home_ground))
        conn.commit()

        print("Team added successfully.")
        print("Your Team ID is:", cursor.lastrowid)
        
    except mysql.connector.Error as err:
        conn.rollback()
        print(f"Error: {err}")
    print()

def add_player():
    player_name = input("Enter player name: ")
    age = int(input("Enter player age: "))
    role = input("Enter player role (Batsman/Bowler/All-rounder/Wicketkeeper): ")
    batting_style = input("Enter batting style (Right-hand/Left-hand): ")
    bowling_style = input("Enter bowling style (Right-arm/Left-arm/None): ")

    try:
        query= "INSERT INTO players (name, age, role, batting_style, bowling_style) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(query, (player_name, age, role, batting_style, bowling_style))
        conn.commit()
    
        print("Player added successfully.")
        print("Your Player ID is:", cursor.lastrowid)
    
    except mysql.connector.Error as err:
        conn.rollback()
        print(f"Error: {err}")
    print()

def add_venue():
    venue_name = input("Enter venue name: ")
    location = input("Enter location: ")
    capacity = int(input("Enter capacity: "))

    try:
        query = "INSERT INTO venues (name, location, capacity) VALUES (%s, %s, %s)"
        cursor.execute(query, (venue_name, location, capacity))
        conn.commit()

        print("Venue added successfully.")
        print("Your Venue ID is:", cursor.lastrowid)
    
    except mysql.connector.Error as err:
        conn.rollback()
        print(f"Error: {err}")
    print()

def add_umpire():
    umpire_name = input("Enter umpire name: ")
    experience_years = int(input("Enter years of experience: "))

    try:
        query = "INSERT INTO umpires (name, experience) VALUES (%s, %s)"
        cursor.execute(query, (umpire_name, experience_years))
        conn.commit()

        print("Umpire added successfully.")
        print("Your Umpire ID is:", cursor.lastrowid)
    
    except mysql.connector.Error as err:
        conn.rollback()
        print(f"Error: {err}")
    print()

def add_player_to_team():
    player_id = int(input("Enter player id: "))
    team_id = int(input("Enter team id: "))
    contract_start = input("Enter contract start date (YYYY-MM-DD): ")
    contract_end = input("Enter contract end date (YYYY-MM-DD): ")

    try:
        query = "INSERT INTO team_players (team_id, player_id, contract_start, contract_end) VALUES(%s, %s, %s, %s)"
        cursor.execute(query, (team_id, player_id, contract_start, contract_end))
        conn.commit()

        print("Player added to Team successfully")
    
    except mysql.connector.Error as err:
        conn.rollback()
        print(f"Error: {err}")
    print()

def add_matches():
    team1_id = int(input("Enter Team 1 ID: "))
    team2_id = int(input("Enter Team 2 ID: "))
    venue_id = int(input("Enter Venue ID: "))
    umpire_id = int(input("Enter Umpire ID: "))
    date = input("Enter match date (YYYY-MM-DD): ")
    toss_winner = int(input("Enter Toss Winner Team ID: "))
    toss_decision = input("Enter Toss Decision (Bat/Bowl): ")
    team_1_score = int(input("Enter Team 1 Score: "))
    team_2_score = int(input("Enter Team 2 Score: "))
    team_1_wickets = int(input("Enter Team 1 Wickets Lost: "))
    team_2_wickets = int(input("Enter Team 2 Wickets Lost: "))
    match_result = input("Enter Match Result (Team 1/Team 2/Draw & By _ Runs/Wickets): ")
    weather = input("Enter Weather Conditions: ")

    if team1_id == team2_id:
        print("Error: A team cannot play against itself.")
        return
    try:
        query = """INSERT INTO matches (team1_id, team2_id, venue_id, umpire_id, date, toss_winner, toss_decision, team_1_score, team_2_score, team_1_wickets, team_2_wickets, match_result, weather) 
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
        cursor.execute(query, (team1_id, team2_id, venue_id, umpire_id, date, toss_winner, toss_decision, team_1_score, team_2_score, team_1_wickets, team_2_wickets, match_result, weather))
        conn.commit()

        print("Match added successfully.")
        print("Your Match ID is:", cursor.lastrowid)

    except mysql.connector.Error as err:
        conn.rollback()()
        print(f"Error: {err}")
    print()

def add_player_stats():
    player_id = int(input("Enter Player ID: "))
    match_id = int(input("Enter Match ID: "))
    # batting stats
    runs_scored = int(input("Enter Runs Scored: "))
    balls_faced = int(input("Enter Balls Faced: "))
    fours = int(input("Enter Number of Fours: "))
    sixes = int(input("Enter Number of Sixes: "))
    # bowling stats
    overs_bowled = float(input("Enter Overs Bowled: "))
    runs_conceded = int(input("Enter Runs Conceded: "))
    wickets = int(input("Enter Wickets Taken: "))
    # fielding stats
    catches = int(input("Enter No.of Catches Taken: "))
    run_outs = int(input("Enter No.of Run Outs Made: "))
    stumpings = int(input("Enter No.of Stumpings Made: "))

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
        print("Player stats added and cumulative stats updated successfully.")

    except mysql.connector.Error as err:
        conn.rollback()
        print(f"Error: {err}")
    print()


def view_teams():
    cursor.execute('SELECT * FROM teams')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Captain', 'Coach', 'Home Ground'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_players():
    cursor.execute('SELECT * FROM players')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Age', 'Role', 'Batting Style', 'Bowling Style'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_venues():
    cursor.execute('SELECT * FROM venues')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Location', 'Capacity'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_umpires():
    cursor.execute('SELECT * FROM umpires')
    rows = cursor.fetchall()
    table = PrettyTable(['ID', 'Name', 'Experience (Years)'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_matches():
    cursor.execute('SELECT * FROM matches')
    rows = cursor.fetchall()
    table = PrettyTable(['Match ID', 'Team 1 ID', 'Team 2 ID', 'Venue ID', 'Umpire ID', 'Date', 'Toss Winner', 'Toss Decision', 'Team 1 Score', 'Team 2 Score', 'Team 1 Wickets', 'Team 2 Wickets', 'Match Result', 'Weather'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_batting_stats():
    cursor.execute('SELECT * FROM batting_stats')
    rows = cursor.fetchall()
    table = PrettyTable(['Player ID', 'Matches Played', 'Runs Scored', 'Balls Faced', 'Strike Rate', 'Fours', 'Sixes', 'Fifties', 'Hundreds'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_bowling_stats():
    cursor.execute('SELECT * FROM bowling_stats')
    rows = cursor.fetchall()
    table = PrettyTable(['Player ID', 'Matches Played', 'Overs Bowled', 'Runs Conceded', 'Economy', 'Wickets Taken'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_fielding_stats():
    cursor.execute('SELECT * FROM fielding_stats')
    rows = cursor.fetchall()
    table = PrettyTable(['Player ID', 'Matches Played', 'Catches', 'Run Outs', 'Stumpings'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def view_player_match_stats():
    cursor.execute('SELECT * FROM player_match_stats')
    rows = cursor.fetchall()
    table = PrettyTable(['Player ID', 'Match ID', 'Runs Scored', 'Balls Faced', 'Fours', 'Sixes', 'Wickets Taken', 'Overs Bowled', 'Runs Conceded', 'Catches', 'Run Outs', 'Stumpings'])
    for row in rows:    
        table.add_row(row)
    print(table)
    print()

def export_data(tablename):
    cursor.execute(f'SELECT * FROM {tablename}')
    rows = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]

    os.makedirs('export', exist_ok=True)
    df = pd.DataFrame(rows, columns=columns)
    df.to_csv(f'export/{tablename}.csv', index=False)
    print(f"Data exported to {tablename}.csv successfully.\n Please check the 'export' folder.")