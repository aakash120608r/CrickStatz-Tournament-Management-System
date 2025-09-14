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
        query = "INSERT INTO team_players (team_id, player_id, contract_start, contract_end) VALUES(%s, %s, %s , %s)"
        cursor.execute(query, (team_id, player_id, contract_start, contract_end))
        conn.commit()

        print("Player added to Team successfully")
    
    except mysql.connector.Error as err:
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
        print(f"Error: {err}")
    print()
