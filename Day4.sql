📁 day4.sql
-- ✅ Day 4: SQL Practice Questions (Set 4)
-- 📘 Table: employees

-- 1. Employees whose salary is NOT between 40,000 and 60,000
SELECT * FROM employees
WHERE salary NOT BETWEEN 40000 AND 60000;

-- 2. Employees hired in March (any year)
SELECT * FROM employees
WHERE MONTH(hire_date) = 3;

-- 3. Number of employees in each department with more than 2 people
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 4. Employees whose name contains exactly 5 letters
SELECT * FROM employees
WHERE name LIKE '_____';

-- 5. Employees in HR or with salary > 70,000
SELECT * FROM employees
WHERE department = 'HR' OR salary > 70000;

-- 6. Names with their first 3 letters only
SELECT LEFT(name, 3) AS short_name
FROM employees;

-- 7. Count of employees whose name starts with a vowel
SELECT COUNT(*) FROM employees
WHERE name REGEXP '^[AEIOUaeiou]';

-- 8. Departments sorted by average salary (highest first)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- 9. Employees hired in the last 2 years
SELECT * FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 10. Name, department, and length of name
SELECT name, department, LENGTH(name) AS name_length
FROM employees;
