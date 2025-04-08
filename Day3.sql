📄 Day3.sql
-- ✅ Day 3: More SQL Practice Questions

-- 1. Find employees whose name ends with 'e'
SELECT * FROM employees
WHERE name LIKE '%e';

-- 2. Find employees whose name contains 'ar'
SELECT * FROM employees
WHERE name LIKE '%ar%';

-- 3. Find employees hired before 2020
SELECT * FROM employees
WHERE hire_date < '2020-01-01';

-- 4. List names of employees who earn more than 55,000 and are in the IT department
SELECT name FROM employees
WHERE salary > 55000 AND department = 'IT';

-- 5. Show name and salary of employees sorted by salary (ascending)
SELECT name, salary FROM employees
ORDER BY salary ASC;

-- 6. Display all unique department names
SELECT DISTINCT department FROM employees;

-- 7. Find average salary for each department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 8. Count how many employees were hired in each year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS emp_count
FROM employees
GROUP BY YEAR(hire_date);

-- 9. Find the name of the employee(s) with the lowest salary
SELECT name FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 10. Show names of employees with exactly 4-letter names
SELECT * FROM employees
WHERE name LIKE '____';
