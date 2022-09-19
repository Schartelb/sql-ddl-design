-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league;

CREATE TABLE team_list(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    hometown TEXT
);

CREATE TABLE player_list(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT, 
    team_id INTEGER REFERENCES team_list
);

CREATE TABLE match_list(
    id SERIAL PRIMARY KEY,
    team1 INTEGER NOT NULL REFERENCES team_list,
    team2 INTEGER CHECK (team2 != team1) NOT NULL REFERENCES team_list,
    location TEXT, 
    date DATE NOT NULL
);

CREATE TABLE referee_list(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE officiate_matches(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES match_list NOT NULL,
    ref_id INTEGER REFERENCES referee_list NOT NULL
);

CREATE TABLE goal_list(
    id SERIAL PRIMARY KEY,
    scorer INTEGER REFERENCES player_list NOT NULL,
    match_id INTEGER REFERENCES match_list NOT NULL,
    match_time INTEGER
);



