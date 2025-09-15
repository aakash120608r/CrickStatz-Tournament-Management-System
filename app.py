import mysql.connector

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
