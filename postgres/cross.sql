
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Inserting sample data
INSERT INTO employees VALUES (1, 'John Doe', 101);
INSERT INTO employees VALUES (2, 'Jane Smith', 102);

INSERT INTO departments VALUES (101, 'Human Resources');
INSERT INTO departments VALUES (102, 'Marketing');



SELECT * from employees;
SELECT * from departments;



-- CROSS JOIN (2ta table r moddhe cartesian product toyri hoy) => 1st table r shob gula row r sathe 2nd table 1st row then 2nd table r bakigular JOIN hobe
-- 2 x 2 = 4 => total 4ta row hobe final result e (if both table has 2 row of data)
SELECT * FROM employees
    CROSS JOIN departments



-- Natural JOIN (korar shomoy 2ta table akta common column thakte hobe & jei row te oi same column r value same shudhu shei row gulai thakbe)
-- 2ta table join hobe thik e but same id gular jonno hobe kono data duplicate hobe na -> table 1r akta row r jonno table 2 r akta row sathei join hobe
SELECT * FROM employees
    NATURAL JOIN departments

