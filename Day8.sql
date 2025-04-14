📅 Day 8 - SQL Joins Deep Dive

✅ Topics Covered:
Understanding different types of JOINs in SQL:
- INNER JOIN
- LEFT JOIN (LEFT OUTER JOIN)
- RIGHT JOIN (RIGHT OUTER JOIN)
- FULL JOIN (FULL OUTER JOIN)
- CROSS JOIN

🔗 JOIN Definitions:
A JOIN is used to combine data from two or more tables based on a related column. It’s commonly used to retrieve meaningful data from normalized databases where information is stored in separate tables.

🧪 Practical Queries:

1. INNER JOIN – Common records from both tables:
```sql
SELECT c.customer_name, o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
```

2. LEFT JOIN – All customers, with orders if available:
```sql
SELECT c.customer_name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
```

3. RIGHT JOIN – All orders, with customer info if available:
```sql
SELECT o.order_id, o.amount, c.customer_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;
```

4. LEFT JOIN (Customers with no orders):
```sql
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

5. Orders in April 2025:
```sql
SELECT o.order_id, o.amount, o.order_date, c.customer_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE MONTH(o.order_date) = 4 AND YEAR(o.order_date) = 2025;
```

6. Total Amount Spent by Each Customer:
```sql
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
```

7. Average Order Amount:
```sql
SELECT c.customer_name, AVG(o.amount) AS avg_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
```

8. Highest Order Amount per Customer:
```sql
SELECT c.customer_name, MAX(o.amount) AS highest_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
```

9. Total Orders per Country:
```sql
SELECT c.country, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.country;
```

📌 Key Learnings:
- JOINs are essential for working with multiple tables.
- LEFT JOIN is useful to find unmatched records.
- Aggregation with JOINs helps in analyzing grouped data.


