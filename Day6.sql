📁 day6.sql

-- Day 6 – SQL Practice (Joins, Window Functions, Subqueries)
-- Tables: employees, departments

-- 1. Get employee names with their department names using JOIN
SELECT e.name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.id;

-- 2. Find employees who earn more than the average salary of their department
SELECT name, department_id, salary
FROM employees e
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE department_id = e.department_id
);

-- 3. Display the top 3 highest paid employees
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 4. Find employees who have the same salary as someone in a different department
SELECT DISTINCT e1.*
FROM employees e1
JOIN employees e2
  ON e1.salary = e2.salary AND e1.department_id != e2.department_id;

-- 5. Rank employees by salary within their department
SELECT name, department_id, salary,
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 6. Get the highest paid employee in each department
SELECT *
FROM (
  SELECT *, 
         RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rnk
  FROM employees
) ranked
WHERE rnk = 1;

-- 7. Show total number of employees and average salary per department
SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- 8. List employees hired after the average hire date
SELECT * FROM employees
WHERE hire_date > (SELECT AVG(hire_date) FROM employees);

-- 9. Display department names that have more than 5 employees
SELECT d.department_name
FROM departments d
JOIN employees e ON d.id = e.department_id
GROUP BY d.department_name
HAVING COUNT(*) > 5;

-- 10. List employees along with their salary difference from department average
SELECT name, department_id, salary,
       salary - AVG(salary) OVER (PARTITION BY department_id) AS salary_diff
FROM employees;
