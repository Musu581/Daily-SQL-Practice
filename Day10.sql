-- ✅ Day 10 – SQL Practice 
-- Tables: customers, orders

-- 1. List all customer names and their order IDs (INNER JOIN)
SELECT c.customer_name, o.order_id
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 2. Show all customers and their orders (LEFT JOIN)
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 3. Find customers who haven’t placed any orders
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 4. Show total amount spent by each customer
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 5. Show average order amount per customer
SELECT c.customer_name, AVG(o.amount) AS avg_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 6. Show highest order amount per customer
SELECT c.customer_name, MAX(o.amount) AS highest_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 7. List all orders placed in April 2025
SELECT o.order_id, o.order_date, o.amount
FROM orders o
WHERE MONTH(o.order_date) = 4 AND YEAR(o.order_date) = 2025;

-- 8. Show customers who spent more than ₹1000 in total
SELECT c.customer_name, SUM(o.amount) AS total
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total > 1000;

-- 9. Show total number of orders from each country
SELECT c.country, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country;

-- 10. Show customers who placed more than 1 order
SELECT c.customer_name, COUNT(o.order_id) AS num_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING num_orders > 1;
