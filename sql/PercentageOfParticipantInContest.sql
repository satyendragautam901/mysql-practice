-- create db for user and registration

create database User_Registration;
use User_Registration;

-- Drop existing tables if needed
DROP TABLE IF EXISTS Register;
DROP TABLE IF EXISTS Users;

-- Create Users table
-- Drop existing tables if they exist
DROP TABLE IF EXISTS Register;
DROP TABLE IF EXISTS Users;

-- Create Users table with user_name
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
);

-- Insert sample users with names
INSERT INTO Users (user_id, user_name) VALUES
(1, 'Aman'),
(2, 'Neha'),
(3, 'Raj'),
(4, 'Sneha'),
(5, 'Yash'),
(6, 'Meena'),
(7, 'Vikas'),
(8, 'Rani'),
(9, 'Amit'),
(10, 'Tina');

-- Create Register table
CREATE TABLE Register (
    user_id INT,
    contest_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert sample contest registrations
INSERT INTO Register (user_id, contest_id) VALUES
(1, 101),
(2, 101),
(3, 102),
(4, 101),
(5, 102),
(6, 103),
(7, 101),
(8, 102),
(1, 102),  -- Aman participated in 2 contests
(9, 103),
(10, 103);

-- find percentage of participant in each contest
SELECT 
  R.contest_id, 
  ROUND(COUNT(DISTINCT R.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register AS R
GROUP BY R.contest_id
ORDER BY percentage DESC, R.contest_id ASC;

