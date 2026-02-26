# Online Store Sales and Customer Analysis

This project presents real business questions solved using Structured Query Language. Each question is shown as a clear heading, followed by the exact code used to solve it. Any user can copy the code directly and run it without changes.

## Active customers by city
```sql
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS active_customers
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY active_customers DESC;
```

## Top cities by number of orders
```sql
SELECT
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_orders DESC;
```

## Category wise total revenue
```sql
SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
```

## Average order value per customer
```sql
SELECT
    c.customer_name,
    AVG(order_total) AS average_order_value
FROM customers c
JOIN (
    SELECT
        o.order_id,
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi
    ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.customer_id
) t
ON c.customer_id = t.customer_id
GROUP BY c.customer_name
ORDER BY average_order_value DESC;
```

## Percentage of cancelled orders
```sql
SELECT
    COUNT(CASE WHEN status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*)
    AS cancelled_percentage
FROM orders;
```

## Paid but not delivered orders
```sql
SELECT
    o.order_id,
    o.status,
    p.payment_status
FROM orders o
JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
AND o.status <> 'Delivered';
```

## Monthly revenue trend
```sql
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;
```

## Top customers by lifetime spending
```sql
SELECT
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS lifetime_spending
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY lifetime_spending DESC;
```

## Most used payment method and success rate
```sql
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    COUNT(CASE WHEN payment_status = 'Paid' THEN 1 END) * 100.0 / COUNT(*)
    AS success_rate
FROM payments
GROUP BY payment_method
ORDER BY total_transactions DESC;
```

## Products ordered despite zero stock
```sql
SELECT
    p.product_name,
    p.stock_quantity,
    SUM(oi.quantity) AS ordered_quantity
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name, p.stock_quantity
HAVING p.stock_quantity = 0;
```

This README is designed so learners, recruiters, and practitioners can clearly see the business question, understand the intent, and reuse the exact code with confidence.

