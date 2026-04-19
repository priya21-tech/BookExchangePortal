CREATE DATABASE book_portal;

USE book_portal;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100)
);
SELECT 1;
USE book_portal;
SELECT * FROM users;
DELETE FROM users;
SELECT * FROM users;
USE book_portal;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    price DOUBLE
);
ALTER TABLE users ADD role VARCHAR(20) DEFAULT 'user';
UPDATE users 
SET role = 'admin' 
WHERE email = 'admin@gmail.com';
UPDATE users 
SET role = 'admin' 
WHERE email = 'admin@gmail.com' AND id > 0;
SELECT email, role FROM users;