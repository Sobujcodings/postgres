-- Active: 1747604834830@@127.0.0.1@5432@ph

SELECT * from person2;
SELECT * from person1;
SELECT * from person3;


-- add a new column in the exiting table using alter (email r value gula default bhabe null dibo apadoto)
ALTER TABLE person2
    ADD COLUMN email VARCHAR(25) DEFAULT 'default@gmail.com' NOT NULL;


-- add a row to this table (shortcut for adding row without the column name);
INSERT into person2 VALUES(7,'rahim', 20, 'abc@gmail.com');
-- ai row te email r value na dileo default nibe karon bole dichi agei
INSERT into person2 VALUES(8,'rahim', 25);



-- add a column and delete/drop that column
ALTER TABLE person2
    DROP COLUMN dob;


-- rename a column name;
ALTER TABLE person2
    RENAME COLUMN age TO person_Age;



-- alter column username varchar(20) to varchar(50)
ALTER TABLE person2
    ALTER COLUMN user_name TYPE VARCHAR(50);


-- add constraints to a existing column (making person_age to NOT NULL) using set!!
ALTER TABLE person2
    ALTER COLUMN person_age set NOT NULL; 


-- remove a constraints (just use drop instead of set)
ALTER TABLE person2
    ALTER COLUMN person_age drop NOT NULL; 


-- add contraints to a column (person2 r person_age e unique add korbo) (unique korte gele duplicate value thakle hobe na age e)
ALTER TABLE person2
    ADD constraint unique_person2_person_age UNIQUE(person_age);


-- delete a column of person2
ALTER Table person2
    DROP person_age;


-- create a column name user_age;
ALTER TABLE person2
    ADD COLUMN user_age INTEGER DEFAULT '18' NOT NULL CHECK (user_age >= 18);


-- add constraints to existring column
ALTER Table person2
    ADD constraint unique_person2_user_age UNIQUE(user_age);


-- add primary to existing column (pk_person2_user_age -> akta constraint r nam dilam)
ALTER Table person2
    ADD constraint pk_person2_user_age PRIMARY KEY(id);


-- drop a constraint according to its constraint name give by me
ALTER Table person2
    DROP constraint pk_person2_user_age;




-- TRUNCATE (as like drop(full table delete kore dey) but ekhane table r structure thakbe but kono record/row thakbe na just column thakbe)
-- DROP Table person2;
TRUNCATE TABLE person1;
