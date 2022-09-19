-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    pref_region  INT REFERENCES region NOT NULL,
    postings_id INT REFERENCES posts,
    fav_post_id INT REFERENCES posts
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INT REFERENCES users,
    location TEXT NOT NULL,
    region_id INT REFERENCES region
    cat_id INT REFERENCES category
);

CREATE TABLE category(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

