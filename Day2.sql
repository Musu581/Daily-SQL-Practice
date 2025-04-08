📄 Day2.sql
-- ✅ Day 2: Intermediate SQL Practice

-- 1. Find employees with salary between 50,000 and 60,000
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 60000;

-- 2. List employees who are not in the HR department
SELECT * FROM employees
WHERE department != 'HR';

-- 3. Get the names and departments of employees hired after Jan 1, 2020
SELECT name, department FROM employees
WHERE hire_date > '2020-01-01';

-- 4. Find the number of employees in each department
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;

-- 5. Get the total salary paid to IT department employees
SELECT SUM(salary) AS total_salary
FROM employees
WHERE department = 'IT';

-- 6. Find the second highest salary
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- 7. List employees whose name starts with 'A'
SELECT * FROM employees
WHERE name LIKE 'A%';

-- 8. Get employees hired in the year 2020
SELECT * FROM employees
WHERE YEAR(hire_date) = 2020;

-- 9. Show the employee(s) with the highest salary
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 10. Display name and hire month of all employees
SELECT name, MONTHNAME(hire_date) AS hire_month
FROM employees;
