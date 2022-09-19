-- from the terminal run:
-- psql < medical_center.sql
DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    phone VARCHAR(12) NOT NULL,
    spec_id INT REFERENCES speciality(id) ON DELETE SET NULL
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    phone VARCHAR(12) NOT NULL
);

CREATE TABLE speciality(
    id SERIAL PRIMARY KEY,
    spec_name TEXT NOT NULL
);

CREATE TABLE doctor_patient(
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id) NOT NULL,
    doc_id INT REFERENCES doctors(id) NOT NULL
);

CREATE TABLE disease(
    id SERIAL PRIMARY KEY,
    dis_name TEXT UNIQUE NOT NULL
);

CREATE TABLE diagnosis(
    id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(id) NOT NULL,
    doc_id INT REFERENCES doctors(id) NOT NULL,
    disease_id INT REFERENCES disease(id) NOT NULL
);