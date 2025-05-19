-- practice of select commands

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES
('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', '2004-01-15', 'O+', 'USA'),
('Jane', 'Smith', 21, 'B', 'History', 'jane.smith@example.com', '2003-05-20', 'A-', 'Canada'),
('Alice', 'Johnson', 19, 'A', 'Physics', 'alice.johnson@example.com', '2005-12-01', 'B+', 'UK'),
('Bob', 'Williams', 22, 'C', 'Chemistry', 'bob.williams@example.com', '2001-07-03', 'AB-', 'Australia'),
('Charlie', 'Brown', 20, 'B', 'English', NULL, '2004-03-30', 'A+', 'New Zealand'),
('Emma', 'Jones', 23, 'B', 'Biology', 'emma.jones@example.com', '2000-09-12', 'O+', 'USA'),
('Michael', 'Johnson', 22, 'C', 'Physics', 'michael.johnson@example.com', '2002-04-05', 'O-', 'Canada'),
('Olivia', 'Davis', 21, 'A', 'Math', 'olivia.davis@example.com', '2003-12-18', 'B-', 'UK'),
('William', 'Taylor', 20, 'B', 'Chemistry', NULL, '2004-08-30', 'A-', 'Australia'),
('Sophia', 'Brown', 24, 'A', 'English', 'sophia.brown@example.com', '1999-06-25', 'AB+', 'New Zealand'),
('Liam', 'Miller', 19, 'C', 'History', 'liam.miller@example.com', '2002-02-10', 'A-', 'USA'),
('Ava', 'Anderson', 22, 'B', 'Biology', 'ava.anderson@example.com', '2000-11-15', 'B+', 'Canada');



SELECT * FROM students;

-- single/multiple column select
SELECT first_name,age,email FROM students;



-- alias (column nam akta but dekhabe arek nam terminal e)
SELECT first_name, email as "Students_Email" FROM students;



-- ORDER BY (ASC DESC order e dekhbe data)
SELECT * from students ORDER BY first_name ASC;
SELECT * from students ORDER BY age ASC;
SELECT * from students ORDER BY age DESC;
SELECT * from students ORDER BY dob ASC;