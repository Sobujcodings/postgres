-- View (Virtual table)
-- (its like function amra akta query likhe sheta variable like jaygay store kore rakhte pari jate sheta bar bar use korte pari 
-- -> bar bar lekhar drkr na pore)
-- use this view while working a complex query (write once use anytime)

-- Simplifying complex queries
-- Improved security (bayrer kaoke akta query dite hole just view r nam diye dibo -> pura query dewa lagbe na dile table detials leak hobe)
-- Enhanced data abstraction (tar fole data abstraction ta barlo kichu data hide kore rakhte parlam)


-- 1. Meterialised VIEW     (view r query result ta physically ak jaygay store kore rakhe -> tarpor jokhon call kori result ta diye dey)
-- 2. Non-Meterialised VIEW (all we hv seen here -> jotobar view k call korbo totobar view r shei query ta k run korbe)


SELECT * FROM employes;


-- View named as how the function works.  
-- GROUP BY use korle * all use kora jabe nah(tobe multiple column show kora jabe) -> karon ore bolte hobe ai dept_name grp tar jonno ami ki ki jinish show korte chai from the table
CREATE View dept_avg_salary
AS
SELECT department_name, avg(salary) FROM employes
    GROUP BY department_name;


-- now we can call the view (dept_avg_salary) then get the data automatically from that view its like calling the view
SELECT * FROM dept_avg_salary;




-- another exmple VIEW
CREATE view test_view
AS
SELECT employee_name, salary, department_name 
    FROM employes
    WHERE department_name IN
    (SELECT department_name FROM employes WHERE department_name LIKE '%R%');

-- calling the View
SELECT * from test_view;
