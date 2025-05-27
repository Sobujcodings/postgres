-- practice of select commands

-- postgreSQL Supports standard SQL plus extra powerful features, like JSON, custom types, full-text search, etc.

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



-- disctic countries
SELECT country FROM students ORDER BY country ASC ;
-- disctic countries
SELECT DISTINCT country FROM students;


 

-- WHERE for filtering using condition
SELECT * FROM students 
    WHERE country =   'USA';

-- select students from 'A' grande in physics AND
SELECT * from students
    WHERE grade = 'A' AND course='Physics' ;
-- OR
SELECT * from students
    WHERE country = 'USA' OR country='Australia' ;
-- OR
SELECT * from students
    WHERE (country = 'USA' OR country='Australia') AND age=20 ;

-- select all from students with grade A or B in Math or Physics
SELECT * from students
    WHERE (grade = 'A' OR grade='B') AND (course = 'Math' OR course = 'physics');


-- NOT operator
SELECT * FROM students
    WHERE NOT country = 'USA';


-- comparison operator (=,>,<,!=)
SELECT * from students
    -- WHERE age <= 20 AND course='History' ;
    -- WHERE age >= 20 AND course='History' ;
    -- WHERE age != 20;
    WHERE age <> 20;





-- Exploring (Scaler) and (Aggregate) #function in postgreSQL
-- Scaler function(run for each row each time return each value each time) => upper(), lower(), concat(),length();
-- Aggregate function(runs only one time return a value) => AVG(), MAX(), MIN(), SUM(), COUNT();
-- (shob gula data niye process kore akta value return korbe)

-- upper (function)
SELECT upper(first_name) as name_capital , * FROM students;
SELECT lower(first_name) as name_capital , * FROM students;

-- concat (function)
SELECT concat(first_name,' ', last_name), * FROM students;
SELECT length(first_name), * FROM students;



-- aggregate function (shob gula data niye process kore akta value return korbe)
SELECT avg(age) from students;
SELECT MAX(age) from students;
SELECT MIN(age) from students;
SELECT COUNT(age) from students;
-- row number count
SELECT COUNT(*) from students;
SELECT SUM(age) from students;


-- which first_name length has max value return that 
-- SELECT max(first_name) FROM students;
SELECT max(length(first_name)) FROM students;



-- NULL(speacial in postgres) (IS  NULL -> IS NOT  NULL) r sathe jai kori(add,subtract,division,multiplication) NULL e dibe
SELECT NULL = 1;
SELECT NULL <> 1;


-- return value which value is not NULL (karon null k compare korle null e pabo -> amdr pete hobe true/false)
SELECT * FROM students
    WHERE email IS  NULL;

SELECT * FROM students
    WHERE email IS NOT NULL;


-- IF we want all the null value get a default value when i select all the data from the table;
SELECT * FROM students
    WHERE email IS  NULL;


-- COALESCE operator (jei argument gula pass korbo shetar jonno prothom e jeta pabe shetay null shei default value boshabe)
SELECT COALESCE(email,'Email not provided') FROM students ;
SELECT COALESCE(email,'Email not provided') as email, first_name, age, dob FROM students ;



-- IN (instead of multiple OR)
SELECT * FROM students
    -- WHERE country = 'USA' OR country = 'UK' OR country = 'CANADA' ;
    WHERE country IN('USA','UK', 'Canada') ;

-- NOT IN (reverse of IN)
SELECT * FROM students
    WHERE country NOT IN('USA','UK', 'Canada') ;


-- BETWEEN (show data between a range of value)
SELECT * from students
    -- WHERE age BETWEEN 19 and 22;
    WHERE dob BETWEEN '2000-01-01' and '2005-01-01' ORDER BY dob ASC;


-- LIKE  (search r moto -> akta data dibo shetar moto match pele return korbe)
-- '%' mane start e ja khushi hote pare, '%am' shesh e am jegulay ache dekhao.
-- 'W%' start hoice W diye, shesh hobe ja khushi diye -> shegula dekhao.
-- '__a' first 2ta character jani na, 3rd character hobe a -> total 3ta char hobe must.
-- '__a%' first 2ta character jani na, 3rd character hobe a, shesh a ja khushi thakte pare.
SELECT * FROM students
    -- WHERE first_name LIKE '%am';
    -- WHERE first_name LIKE '%m';
    -- WHERE first_name LIKE 'William';
    -- WHERE first_name LIKE 'W%';
    -- WHERE first_name LIKE '__a';
    -- WHERE first_name LIKE '__a%';
    -- WHERE first_name LIKE '__a_%';
    WHERE first_name LIKE '__a_';


-- ILIKE (serach r character gula case-sensitive nah) A khujte a likhleo dibe
SELECT * FROM students
    WHERE first_name ILIKE 'A%'




-- LIMIT OFFSET (for pagination) -> koyta column koyta row dibe ta amra filter kore dite pari
-- LIMIT -> jotogula record dibe
-- OFFSET -> jotoguala bad diye porer gula dibe
-- shob query r shesh e diye dile limit hoye ashbe 
SELECT * FROM students LIMIT 5;
SELECT * FROM students
    WHERE country IN('USA','UK', 'Canada') LIMIT 5;

-- prothom theke koyta bad diye porer gula dibe.
SELECT * FROM students LIMIT 5 OFFSET 2;

-- LIMIT OFFSET IN PAGINATION
-- OFFSET 5 * 0 -> prothom theke 0ta bad dibe, 5 * 1 -> prothom theke 5 ta bad diye bakigula dekhabe (next page) -> next page  
SELECT * FROM students LIMIT 5 OFFSET 5 * 0;
SELECT * FROM students LIMIT 5 OFFSET 5 * 1;
SELECT * FROM students LIMIT 5 OFFSET 5 * 2;
SELECT * FROM students LIMIT 5 OFFSET 5 * 3;





-- DELETE table data (delete kore felbe any row of that value)
DELETE FROM students
    WHERE grade = 'B' AND country = 'USA';



-- UPDATE (shudhu email e set dile shob email change hoye jabe (condition diye bolte hobe kontar email change korbe))
-- must use condition while update a value else shob data change hoye jabe shei column r
-- NULL diye kono kichu = kora jabe na instead use ISNULL/IS NOT NULL
UPDATE students
    set email = 'default@gmail.com'
    -- WHERE student_id = 33;
    WHERE email IS NULL;


-- UPDATE for multiple column
UPDATE students
    set email = 'default@gmail.com', age = 30
    WHERE student_id =  30;
