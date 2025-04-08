📄 Day1.sql
-- 🛠️ Step 1: Create the Table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);
-- 🧩 Step 2: Insert Sample Data
INSERT INTO employees (id, name, department, salary, hire_date)
VALUES
(1, 'Alice', 'HR', 50000, '2020-01-15'),
(2, 'Bob', 'IT', 60000, '2019-03-12'),
(3, 'Charlie', 'IT', 70000, '2018-07-22'),
(4, 'Diana', 'Finance', 65000, '2021-05-18'),
(5, 'Eva', 'HR', 52000, '2020-10-10');

-- ✅ Day 1: Basic SQL Questions Practice

-- 1. Select all employees
SELECT * FROM employees;

-- 2. Get the names of all employees
SELECT name FROM employees;

-- 3. Find employees in the IT department
SELECT * FROM employees
WHERE department = 'IT';

-- 4. Find employees with salary > 60000
SELECT * FROM employees
WHERE salary > 60000;

-- 5. Sort employees by salary (highest to lowest)
SELECT * FROM employees
ORDER BY salary DESC;

-- 6. Count total number of employees
SELECT COUNT(*) FROM employees;

-- 7. Find the average salary
SELECT AVG(salary) FROM employees;

-- 8. Find the highest salary
SELECT MAX(salary) FROM employees;

-- 9. Group employees by department and count how many in each
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- 10. Find employees hired after 2020
SELECT * FROM employees
WHERE hire_date > '2020-01-01';
