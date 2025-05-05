# 📅 Day 11 - SQL Interview Practice

✅ **Topics Covered:**
- GROUP BY & HAVING
- Aggregate functions (COUNT, SUM)
- Real-world data analysis queries

---

### ❓ 1. Find customers who made more than one purchase.

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

### ❓ 2. Find the second highest salary.
  
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
