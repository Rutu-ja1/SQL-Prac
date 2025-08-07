
-- SQL Dump for Virtual Medical Assistant Project (Updated)
-- Includes Data Insertion and Handling NULLs
-- Updated on 2025-08-07

-- Drop existing tables if they exist
DROP TABLE IF EXISTS consultations;
DROP TABLE IF EXISTS symptoms_map;
DROP TABLE IF EXISTS health_articles;
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(256) NOT NULL,
    age INT CHECK (age > 0),
    gender VARCHAR(10) DEFAULT 'Not Specified'
);

-- Create symptoms_map table
CREATE TABLE symptoms_map (
    symptom VARCHAR(100) PRIMARY KEY,
    possible_condition VARCHAR(100) DEFAULT 'Unknown'
);

-- Create consultations table
CREATE TABLE consultations (
    consult_id INT PRIMARY KEY,
    user_id INT,
    symptoms TEXT NOT NULL,
    diagnosis VARCHAR(100),
    consult_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create health_articles table
CREATE TABLE health_articles (
    article_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    category VARCHAR(50) DEFAULT 'General'
);

-- Insert sample users (with handling for NULL/default)
INSERT INTO users VALUES 
(101, 'Rutuja Mehare', 'rutuja@email.com', SHA2('password123', 256), 23, 'Female'),
(102, 'Saurabh Mehare', 'saurabh@email.com', SHA2('pass456', 256), NULL, NULL);

-- Insert sample symptoms
INSERT INTO symptoms_map VALUES 
('fever', 'Common Cold'),
('cough', 'Bronchitis'),
('headache', 'Migraine'),
('nausea', NULL);

-- Insert sample consultations
INSERT INTO consultations VALUES 
(1, 101, 'fever, cough', 'Common Cold', CURRENT_DATE),
(2, 102, 'headache, nausea', NULL, NULL);

-- Insert sample health articles
INSERT INTO health_articles VALUES 
(1, 'Understanding Diabetes', 'Diabetes is a chronic condition...', 'Diabetes'),
(2, 'How to manage stress', 'Stress management techniques include...', 'Mental Health'),
(3, 'Healthy Eating Tips', NULL, NULL);

-- Show all tables
SHOW TABLES;
