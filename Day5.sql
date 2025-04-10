📁 day5.sql
-- ✅ Day 5: SQL Practice Questions (Set 5)
-- 📘 Table: employees

-- 1. Employees who earn more than the average salary
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Second highest salary using LIMIT
SELECT DISTINCT salary FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 3. Department(s) with the highest total salary
SELECT department
FROM employees
GROUP BY department
ORDER BY SUM(salary) DESC
LIMIT 1;

-- 4. Employees hired on the same day
SELECT * FROM employees
WHERE hire_date IN (
  SELECT hire_date
  FROM employees
  GROUP BY hire_date
  HAVING COUNT(*) > 1
);

-- 5. Highest paid employee in each department
SELECT e.name, e.department, e.salary
FROM employees e
WHERE salary = (
  SELECT MAX(salary)
  FROM employees
  WHERE department = e.department
);

-- 6. Employees not in IT or HR
SELECT * FROM employees
WHERE department NOT IN ('IT', 'HR');

-- 7. Count of employees earning above department average
SELECT COUNT(*) FROM employees e1
WHERE salary > (
  SELECT AVG(salary)
  FROM employees e2
  WHERE e1.department = e2.department
);

-- 8. Difference between max and min salary
SELECT MAX(salary) - MIN(salary) AS salary_difference
FROM employees;

-- 9. Number of vowels in each employee name
SELECT name,
LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'a', '')) -
              LENGTH(REPLACE(LOWER(name), 'e', '')) -
              LENGTH(REPLACE(LOWER(name), 'i', '')) -
              LENGTH(REPLACE(LOWER(name), 'o', '')) -
              LENGTH(REPLACE(LOWER(name), 'u', '')) AS vowel_count
FROM employees;

-- 10. Employees with duplicate salaries
SELECT * FROM employees
WHERE salary IN (
  SELECT salary
  FROM employees
  GROUP BY salary
  HAVING COUNT(*) > 1
);
