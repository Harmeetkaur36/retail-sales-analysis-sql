
USE retail_sales_project;

-- 1. Total revenue
SELECT ROUND(SUM(quantity * unit_price), 2) AS total_revenue
FROM order_details;

-- 2. Total units sold
SELECT SUM(quantity) AS total_units_sold
FROM order_details;

-- 3. Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 4. Revenue by product category
SELECT
    p.category,
    ROUND(SUM(od.quantity * od.unit_price), 2) AS category_revenue
FROM products p
INNER JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 5. Top 5 products by revenue
SELECT
    p.product_name,
    SUM(od.quantity) AS units_sold,
    ROUND(SUM(od.quantity * od.unit_price), 2) AS total_revenue
FROM products p
INNER JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 6. Monthly revenue
SELECT
    MONTH(o.order_date) AS sales_month,
    ROUND(SUM(od.quantity * od.unit_price), 2) AS monthly_revenue
FROM orders o
INNER JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY MONTH(o.order_date)
ORDER BY monthly_revenue DESC;

-- 7. Top 5 customers by spending
SELECT
    c.customer_name,
    ROUND(SUM(od.quantity * od.unit_price), 2) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 8. Payment method analysis
SELECT
    payment_mode,
    COUNT(*) AS total_orders
FROM orders
GROUP BY payment_mode
ORDER BY total_orders DESC;

-- 9. Products with no sales
SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_details od
    ON p.product_id = od.product_id
WHERE od.product_id IS NULL;

-- 10. Low-stock products
SELECT product_name, stock
FROM products
WHERE stock < 15
ORDER BY stock ASC;

-- 11. Orders without order details
SELECT o.order_id, o.order_date
FROM orders o
LEFT JOIN order_details od
    ON o.order_id = od.order_id
WHERE od.order_id IS NULL;
