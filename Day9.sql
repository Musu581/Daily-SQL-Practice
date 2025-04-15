📅 Day 9 - SQL Aggregation & GROUP BY Deep Dive
✅ Topics Covered:
GROUP BY clause

Aggregate functions:
SUM()
AVG()
MAX()
MIN()
COUNT()
Filtering groups with HAVING
Combining GROUP BY with JOIN

🧪 Practical Queries:
1.Total order amount by customer
SELECT customer_id, SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_id;

2.Average order amount per customer
SELECT customer_id, AVG(order_amount) AS avg_spent
FROM orders
GROUP BY customer_id;

3.Number of orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

4.Maximum and Minimum order amount
SELECT MAX(order_amount) AS max_order, MIN(order_amount) AS min_order
FROM orders;

5.Customers who placed more than 1 order
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;
Total order amount by customer (with names - using JOIN)

6.Average order amount by country
SELECT c.country, AVG(o.order_amount) AS avg_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country;
Countries with total spending > 2000

📌 Key Learnings:
GROUP BY is used to organize data into groups for summary analysis.

HAVING filters groups after aggregation (unlike WHERE, which filters rows before grouping).

Aggregation + JOIN = Powerful insights from normalized data.
