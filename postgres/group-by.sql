-- aggregate function -> group by te beshi use hoy
-- GROUP BY -> 👉 "Group all the rows where the columnName/country is the same."  column onujayi group hobe
-- HAVING -> Group korar por shetake filter korte pari having diye (instead of where use this)
-- WHERE -> runs for each row || HAVING -> runs for each GROUP


SELECT * from students;

-- 1. Filter group using HAVING to show only countries with Average Age abose 22;
-- 2. Count Students born in Each Year.
-- select & group by 2ta tei same column nam hote hobe (every country column ak akta group hoye jabe)
-- SELECT * FROM students; XXX;  count(*) => row number count -> (how many students belongs to each country); ai akta country koybar ache ai pura record e 
-- SELECT + HAVING => e direct aggregate (avg,min,max) use korte parbo
 

-- 1. Filter group using HAVING to show only countries with Average Age abose 22;
SELECT country FROM students
    GROUP BY country
    HAVING avg(age) > 22;



-- another practice
SELECT country, COUNT(*), avg(age), age FROM students 
    GROUP BY country, age
    HAVING avg(age) > 22 AND age > 23;



-- 2. Count Students born in Each Year (dob theke year gula ber kore nibo extract kore) !!!
-- select e count(*) use korle group by use korte hobe(count korte group kore count ber kore)
-- extract(year from dob) k select korle group o korte hobe extract(year from dob) diye (tahole duplicate value ashbe na)
SELECT extract(year from dob) as birth_year, count(*) FROM students
    -- GROUP BY extract(year from dob);
    GROUP BY birth_year;
