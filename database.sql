CREATE DATABASE IF NOT EXISTS crickstatz;
USE crickstatz;

-- Table: teams
CREATE TABLE IF NOT EXISTS teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    captain VARCHAR(255),
    coach VARCHAR(255),
    home_ground VARCHAR(255)
);

-- Table: players
CREATE TABLE IF NOT EXISTS players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT,
    role ENUM('Batsman','Bowler','All-rounder','Wicketkeeper') NOT NULL,
    batting_style VARCHAR(50),
    bowling_style VARCHAR(50)
);

-- Table: team_players
CREATE TABLE IF NOT EXISTS team_players (
    team_id INT NOT NULL,
    player_id INT NOT NULL PRIMARY KEY,
    contract_start DATE,
    contract_end DATE,
    FOREIGN KEY (team_id) REFERENCES teams(team_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
);

-- Table: venues
CREATE TABLE IF NOT EXISTS venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    capacity INT
);

-- Table: umpires
CREATE TABLE IF NOT EXISTS umpires (
    umpire_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    qualification VARCHAR(255)
);

-- Table: matches
CREATE TABLE IF NOT EXISTS matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    team1_id INT NOT NULL,
    team2_id INT NOT NULL,
    venue_id INT,
    date DATE NOT NULL,
    toss_winner INT,
    match_result VARCHAR(50),
    weather VARCHAR(255),
    FOREIGN KEY (team1_id) REFERENCES teams(team_id) ON DELETE CASCADE,
    FOREIGN KEY (team2_id) REFERENCES teams(team_id) ON DELETE CASCADE,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

-- Table: match_officials
CREATE TABLE IF NOT EXISTS match_officials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    umpire_id INT NOT NULL,
    FOREIGN KEY (match_id) REFERENCES matches(match_id) ON DELETE CASCADE,
    FOREIGN KEY (umpire_id) REFERENCES umpires(umpire_id) ON DELETE CASCADE
);

-- Table: batting_stats
CREATE TABLE IF NOT EXISTS batting_stats (
    player_id INT PRIMARY KEY,
    run_scored INT DEFAULT 0,
    balls_faced INT DEFAULT 0,
    dot_balls INT DEFAULT 0,
    strike_rate FLOAT GENERATED ALWAYS AS ((run_scored / NULLIF(balls_faced, 0)) * 100) STORED,
    fours INT DEFAULT 0,
    sixes INT DEFAULT 0,
    fifties INT DEFAULT 0,
    hundreds INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
);

-- Table: bowling_stats
CREATE TABLE IF NOT EXISTS bowling_stats (
    player_id INT PRIMARY KEY,
    over_bowled FLOAT DEFAULT 0,
    runs_given INT DEFAULT 0,
    economy FLOAT GENERATED ALWAYS AS (runs_given / NULLIF(over_bowled, 0)) STORED,
    fours INT DEFAULT 0,
    sixes INT DEFAULT 0,
    wickets INT DEFAULT 0,
    wides INT DEFAULT 0,
    no_ball INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
);

-- Table: fielding_stats
CREATE TABLE IF NOT EXISTS fielding_stats (
    player_id INT NOT NULL,
    catches INT DEFAULT 0,
    run_outs INT DEFAULT 0,
    stumpings INT DEFAULT 0,
    FOREIGN KEY (match_id) REFERENCES matches(match_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
);

-- Table: player_career_stats
CREATE TABLE IF NOT EXISTS player_career_stats (
    player_id INT PRIMARY KEY,
    total_runs INT DEFAULT 0,
    total_balls INT DEFAULT 0,
    total_wickets INT DEFAULT 0,
    total_catches INT DEFAULT 0,
    total_matches INT DEFAULT 0,
    batting_average FLOAT DEFAULT 0,
    bowling_average FLOAT DEFAULT 0,
    strike_rate FLOAT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
);