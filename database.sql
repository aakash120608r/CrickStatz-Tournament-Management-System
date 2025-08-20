
create table IF NOT EXISTS teams(
    team_id char(3) primary key,
    team_name varchar(100),
    win numeric,
    losses numeric,
    points numeric
);

create table IF NOT EXISTS players(
    player_id char(3) primary key,
    team_id char(3),
    team_name varchar(100),
    type varchar(20),
    foreign key (team_id) references teams(team_id)

);

create table IF NOT EXISTS batting_stats(
    player_id char(3) primary key,
    run_scored numeric,
    balls_faced numeric,
    dot_balls numeric,
    strike_rate numeric generated always as ((run_scored/nullif(balls_faced, 0))*100) stored,
    fours numeric,
    sixes numeric,
    fifties numeric,
    hundreds numeric,
    foreign key (player_id) references players(player_id)

);

create table IF NOT EXISTS bowling_stats(
    player_id char(3) primary key,
    over_bowled numeric,
    runs_given numeric,
    economy numeric generated always as (runs_given/over_bowled) stored,
    fours numeric,
    sixes numeric,
    wickets numeric,
    wides numeric,
    no_ball numeric,
    foreign key (player_id) references players(player_id)
);

create table IF NOT EXIST umpires_lists(
    umpire_id char(3) primary key,
    umpire_name varchar(100),
);