SELECT * FROM cars.core_dataset;

-- Activity 1 - Question 1
-- Display employee details along with manager name

    SELECT
`Employee Name`,
`Employee Number`,
`Department`,
`Position`,
`Manager Name`
FROM cars.core_dataset;


-- Activity 1 - Question 2
-- Find employees hired before their department head

describe cars.core_dataset;

-- ACTIVITY -2 -QUESTION-1 
-- EMPLOYEES ALONG WITH DEPARTMENT AVERAGE SALARY

SELECT
e.`Employee Name` AS employee_name,
e.`Department`,
e.`Date of Hire` AS employee_hire_date,
e.`Manager Name` AS manager_name,
m.`Date of Hire` AS manager_hire_date

FROM cars.core_dataset e

INNER JOIN cars.core_dataset m

ON TRIM(e.`Manager Name`) =
TRIM(CONCAT(
SUBSTRING_INDEX(m.`Employee Name`, ',', -1),
' ',
SUBSTRING_INDEX(m.`Employee Name`, ',', 1)
))

WHERE e.`Date of Hire` < m.`Date of Hire`;

-- QUESTION-2 ACTIVITY-2
-- EMPLOYEES SHARING THE SAME JOB POSITION

SELECT
e.`Employee Name`,
e.`Department`,
e.`Position`,
e.`Pay Rate`,
d.avg_salary

FROM cars.core_dataset e

INNER JOIN
(
SELECT
`Department`,
AVG(`Pay Rate`) AS avg_salary
FROM cars.core_dataset
GROUP BY `Department`
) d

ON e.`Department` = d.`Department`;


SELECT
e.`Employee Name`,
e.`Department`,
e.`Position`,
e.`Pay Rate`,
d.avg_salary

FROM cars.core_dataset e

INNER JOIN
(
SELECT
`Department`,
AVG(`Pay Rate`) AS avg_salary
FROM cars.core_dataset
GROUP BY `Department`
) d

ON e.`Department` = d.`Department`;


SELECT
e.`Employee Name`,
e.`Position`,
p.total_employees

FROM cars.core_dataset e

INNER JOIN
(
SELECT
`Position`,
COUNT(*) AS total_employees

FROM cars.core_dataset

GROUP BY `Position`

HAVING COUNT(*) > 1

) p

ON e.`Position` = p.`Position`

ORDER BY e.`Position`;

