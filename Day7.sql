📁 day7.sql
-- ✅ Day 7 – SQL Practice Questions (Set 7)
-- 📘 Table: employees

-- 1. Find all employees hired on a weekend (Saturday or Sunday)
SELECT * FROM employees
WHERE DAYOFWEEK(hire_date) IN (1, 7);

-- 2. Show employees whose name has more than 2 vowels
SELECT * FROM employees
WHERE LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'a', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'e', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'i', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'o', '')) +
      LENGTH(name) - LENGTH(REPLACE(LOWER(name), 'u', '')) > 2;

-- 3. Display employees sorted by the most recent hire date
SELECT * FROM employees
ORDER BY hire_date DESC;

-- 4. Find the earliest hire date in each department
SELECT department_id, MIN(hire_date) AS first_hired
FROM employees
GROUP BY department_id;

-- 5. Show employees hired in the last 90 days
SELECT * FROM employees
WHERE hire_date >= CURDATE() - INTERVAL 90 DAY;

-- 6. Get the month-wise employee hiring count
SELECT MONTHNAME(hire_date) AS month, COUNT(*) AS count
FROM employees
GROUP BY MONTH(hire_date);

-- 7. List employees whose name starts and ends with the same letter
SELECT * FROM employees
WHERE LOWER(LEFT(name, 1)) = LOWER(RIGHT(name, 1));

-- 8. Show employees who joined between January and March
SELECT * FROM employees
WHERE MONTH(hire_date) BETWEEN 1 AND 3;

-- 9. Get the number of employees hired per year
SELECT YEAR(hire_date) AS year, COUNT(*) AS hires
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY year;

-- 10. Find employees who joined in the same month and year
SELECT * FROM employees e1
WHERE EXISTS (
  SELECT 1 FROM employees e2
  WHERE e1.id != e2.id
    AND MONTH(e1.hire_date) = MONTH(e2.hire_date)
    AND YEAR(e1.hire_date) = YEAR(e2.hire_date)
);
