# 📅 Day 12 - SQL Interview Practice

✅ **Topics Covered:**
- Aggregate filtering
- Subqueries and set comparison
- Analytical business scenarios

---

### ❓ 1. Retrieve customers who placed the highest number of orders.
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = (
    SELECT MAX(order_count)
    FROM (
        SELECT customer_id, COUNT(order_id) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS counts
);

❓ 2. Find employees who earn more than the average salary in their department.

SELECT e.employee_id, e.department_id, e.salary
FROM employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) dept_avg ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_salary;
