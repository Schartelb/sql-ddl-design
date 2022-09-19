-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE city_country(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL UNIQUE,
  country INT REFERENCES country NOT NULL 
);

CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INT REFERENCES airlines NOT NULL,
  departs INT REFERENCES city_country NOT NULL,
  arrives INT REFERENCES city_country NOT NULL CHECK (arrives != departs)
);

INSERT INTO country
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('China'),
  ('Morocco'),
  ('United Kingdom'),
  ('Brazil'),
  ('Chile'),
  ('Mexico')
;

INSERT INTO city_country
  (city, country)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('New York', 1), 
  ('Charlotte', 1),
  ('Cedar Rapids', 1), 
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Tokyo', 2),
  ('Paris',3),
  ('Dubai',4),
  ('Beijing', 5),
  ('Casablanca', 6),
  ('London', 7),
  ('Sao Paolo', 8),
  ('Santiago', 9),
  ('Mexico City',10)
  ;

INSERT INTO airlines
  (name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil')
;

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, departs,arrives)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 10, 15),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00',3, 3, 4),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 18),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 11, 14),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 12, 13),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 5, 6),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00',6, 7, 8),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 6, 9),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7,16, 17);

