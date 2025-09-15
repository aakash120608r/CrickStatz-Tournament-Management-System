CREATE DATABASE IF NOT EXISTS crickstatz;
USE crickstatz;

-- 1. Teams
CREATE TABLE IF NOT EXISTS teams (
    team_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    captain VARCHAR(255),
    coach VARCHAR(255),
    home_ground VARCHAR(255),
    PRIMARY KEY (team_id)
)  ENGINE=InnoDB;

-- 2. Players
CREATE TABLE IF NOT EXISTS players (
    player_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT,
    role ENUM('Batsman','Bowler','All-rounder','Wicketkeeper') NOT NULL,
    batting_style VARCHAR(50),
    bowling_style VARCHAR(50),
    PRIMARY KEY (player_id)
) ENGINE=InnoDB;

-- 3. Venues
CREATE TABLE IF NOT EXISTS venues (
    venue_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    capacity INT,
    PRIMARY KEY (venue_id)
) ENGINE=InnoDB;

-- 4. Umpires
CREATE TABLE IF NOT EXISTS umpires (
    umpire_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    experience INT,
    PRIMARY KEY (umpire_id)
) ENGINE=InnoDB;

-- 5. Matches (depends on Teams + Venues)
CREATE TABLE IF NOT EXISTS matches (
    match_id INT NOT NULL AUTO_INCREMENT,
    team1_id INT NOT NULL,
    team2_id INT NOT NULL,
    venue_id INT,
    umpire_id INT,
    date DATE NOT NULL,
    toss_winner INT,
    toss_decision ENUM('Bat','Bowl'),
    team_1_score INT DEFAULT 0,
    team_2_score INT DEFAULT 0,
    team_1_wickets INT DEFAULT 0,
    team_2_wickets INT DEFAULT 0,
    match_result VARCHAR(50),
    weather VARCHAR(255),
    PRIMARY KEY (match_id),
    FOREIGN KEY (team1_id) REFERENCES teams(team_id) ON DELETE CASCADE,
    FOREIGN KEY (team2_id) REFERENCES teams(team_id) ON DELETE CASCADE,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id) ON DELETE SET NULL,
    FOREIGN KEY (umpire_id) REFERENCES umpires(umpire_id) ON DELETE SET NULL,
    FOREIGN KEY (toss_winner) REFERENCES teams(team_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- 6. Team-Players (depends on Teams + Players)
CREATE TABLE IF NOT EXISTS team_players (
    team_id INT NOT NULL,
    player_id INT NOT NULL,
    contract_start DATE,
    contract_end DATE,
    PRIMARY KEY (team_id, player_id),
    FOREIGN KEY (team_id) REFERENCES teams(team_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 7. Batting Stats (depends on Players)
CREATE TABLE IF NOT EXISTS batting_stats (
    player_id INT NOT NULL,
    matches_played INT DEFAULT 0,
    run_scored INT DEFAULT 0,
    balls_faced INT DEFAULT 0,
    dot_balls INT DEFAULT 0,
    strike_rate FLOAT GENERATED ALWAYS AS ((run_scored / NULLIF(balls_faced, 0)) * 100) STORED,
    fours INT DEFAULT 0,
    sixes INT DEFAULT 0,
    fifties INT DEFAULT 0,
    hundreds INT DEFAULT 0,
    PRIMARY KEY (player_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 8. Bowling Stats (depends on Players)
CREATE TABLE IF NOT EXISTS bowling_stats (
    player_id INT NOT NULL,
    matches_played INT DEFAULT 0,
    over_bowled FLOAT DEFAULT 0,
    runs_given INT DEFAULT 0,
    economy FLOAT GENERATED ALWAYS AS (runs_given / NULLIF(over_bowled, 0)) STORED,
    fours INT DEFAULT 0,
    sixes INT DEFAULT 0,
    wickets INT DEFAULT 0,
    wides INT DEFAULT 0,
    no_balls INT DEFAULT 0,
    PRIMARY KEY (player_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 9. Fielding Stats (depends on Players)
CREATE TABLE IF NOT EXISTS fielding_stats (
    player_id INT NOT NULL,
    matches_played INT DEFAULT 0,
    catches INT DEFAULT 0,
    run_outs INT DEFAULT 0,
    stumpings INT DEFAULT 0,
    PRIMARY KEY (player_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 10. Player-Match Stats (depends on Matches + Players)
CREATE TABLE IF NOT EXISTS player_match_stats (
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    runs_scored INT DEFAULT 0,
    balls_faced INT DEFAULT 0,
    fours INT DEFAULT 0,
    sixes INT DEFAULT 0,
    wickets_taken INT DEFAULT 0,
    overs_bowled FLOAT DEFAULT 0,
    runs_conceded INT DEFAULT 0,
    catches INT DEFAULT 0,
    run_outs INT DEFAULT 0,
    stumping INT DEFAULT 0,
    PRIMARY KEY (match_id, player_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE
) ENGINE=InnoDB;

