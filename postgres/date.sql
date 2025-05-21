-- date
 
 SHOW timezone;
--  Asia/Dhaka

-- time stand -> 2 rokom hote pare timestand, timestand-with-timezone (details info of current date time etc)
SELECT now();

-- create a table to understand this two type of time stand
create TABLE timez(
    ts TIMESTAMP without time zone,
    tsz TIMESTAMP with time zone
);
INSERT INTO timez VALUES('2025-01-12 10:45:00', '2024-01-12 10:45:00');

SELECT * FROM timez;



-- date full information
SELECT now();
-- when i want to see only the date from the all data info of now().
SELECT now()::date;
SELECT now()::time;


-- just todays date
SELECT CURRENT_DATE;
SELECT current_time;




--> to char(timestamp,text) -> formate the time info as per need (this text format is available in postgres site to char() function
SELECT now();
SELECT to_char(now(), 'yyyy-mm-dd');
SELECT to_char(now(), 'yyyy/mm/dd');
SELECT to_char(now(), 'dd/mm/yyyy');
SELECT to_char(now(), 'MONTH');
SELECT to_char(now(), 'W');
SELECT to_char(now(), 'Day');
-- DAY OF THE YEAR
SELECT to_char(now(), 'DDD');
-- day of the month
SELECT to_char(now(), 'DD');
-- day of the week
SELECT to_char(now(), 'D');




-- INTERVAL (time span -> time differece)
SELECT CURRENT_DATE - INTERVAL '1 year';
SELECT CURRENT_DATE - INTERVAL '1 month';
SELECT CURRENT_DATE - INTERVAL '1 year 2 month';



-- find age by two dates
SELECT age(CURRENT_DATE, '1999-09-04');



-- show age of the students instead of the date-of-birth
SELECT * FROM students;

-- shob gular to ashbei + student_age nam e arekta column add hobe which shows the age, as nam na dile age nam e toyri hobe
SELECT *, age(CURRENT_DATE, dob) as student_age FROM students;

-- format the age data (EXTRACT -> akta date theke year month day ber/extract kore niye ashte pari)
SELECT *, 
  EXTRACT(YEAR FROM age(CURRENT_DATE, dob)) || ' years ' ||
  EXTRACT(MONTH FROM age(CURRENT_DATE, dob)) || ' months' AS student_age
FROM students;


-- bole dite hobe j '2025-5-21' ata akta date type
SELECT EXTRACT(YEAR FROM '2025-5-21'::date);
SELECT EXTRACT(day FROM '2025-5-21'::date);


-- :: ebahbe type casting/set korte pari number/y/n string keo boolean e convert korte pari
--> 1 is true, 0 is false, y/yes, n/no => else r kono string boolean hobe na error dibe
SELECT 1::BOOLEAN;
SELECT 0::BOOLEAN;
SELECT 'y'::BOOLEAN;
SELECT 'n'::BOOLEAN;
SELECT 'yes'::BOOLEAN;
-- SELECT 'abc'::BOOLEAN; XXX