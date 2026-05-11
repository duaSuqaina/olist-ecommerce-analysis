-- =============================================
-- OLIST E-COMMERCE — SQL ANALYSIS
-- Author: [Your Name]
-- Date: May 2026
-- Database: olist.db (SQLite)
-- Description: Business analysis of 100,000+
--              orders from Brazilian e-commerce
-- =============================================


-- =============================================
-- Query 1: Revenue by Payment Type
-- Purpose: Identify which payment methods
--          drive the most revenue
-- =============================================

SELECT 
    payment_type,
    COUNT(DISTINCT order_id)     AS total_orders,
    ROUND(SUM(payment_value), 2) AS total_revenue,
    ROUND(AVG(payment_value), 2) AS avg_order_value
FROM payments
GROUP BY payment_type
ORDER BY total_revenue DESC;


-- =============================================
-- Query 2: Top 10 Categories by Revenue
-- Purpose: Identify best performing product
--          categories by total revenue
-- =============================================

SELECT 
    ct.product_category_name_english  AS category,
    COUNT(oi.order_id)                AS total_orders,
    ROUND(SUM(oi.price), 2)           AS total_revenue,
    ROUND(AVG(oi.price), 2)           AS avg_price
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
JOIN category_translation ct 
    ON p.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10;


-- =============================================
-- Query 3: Best Reviewed Product Categories
-- Purpose: Find which categories customers
--          are most satisfied with
-- =============================================

SELECT 
    ct.product_category_name_english AS category,
    ROUND(AVG(r.review_score), 2)    AS avg_review_score,
    COUNT(r.review_id)               AS total_reviews
FROM reviews r
JOIN order_items oi 
    ON r.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
JOIN category_translation ct 
    ON p.product_category_name = ct.product_category_name
GROUP BY category
HAVING total_reviews > 100
ORDER BY avg_review_score DESC
LIMIT 10;


-- =============================================
-- Query 4: Top 10 States by Revenue
-- Purpose: Identify geographical revenue
--          distribution across Brazil
-- =============================================

SELECT 
    c.customer_state              AS state,
    COUNT(DISTINCT o.order_id)    AS total_orders,
    ROUND(SUM(p.payment_value),2) AS total_revenue,
    ROUND(AVG(p.payment_value),2) AS avg_order_value
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN payments p 
    ON o.order_id = p.order_id
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 10;


-- =============================================
-- Query 5: Late Delivery Analysis by State
-- Purpose: Identify which states suffer
--          the worst delivery performance
-- =============================================

SELECT
    c.customer_state AS state,
    COUNT(*)         AS total_orders,
    SUM(CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date 
        THEN 1 ELSE 0 
    END)             AS late_orders,
    ROUND(SUM(CASE 
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date 
        THEN 1 ELSE 0 
    END) * 100.0 / COUNT(*), 2) AS late_percentage
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY state
ORDER BY late_percentage DESC
LIMIT 10;


-- =============================================
-- Query 6: Monthly Revenue Trend
-- Purpose: Track business growth over time
--          and identify seasonal patterns
-- =============================================

SELECT
    SUBSTR(order_purchase_timestamp, 1, 7) AS month,
    COUNT(DISTINCT o.order_id)             AS total_orders,
    ROUND(SUM(p.payment_value), 2)         AS total_revenue
FROM orders o
JOIN payments p 
    ON o.order_id = p.order_id
WHERE order_purchase_timestamp IS NOT NULL
GROUP BY month
ORDER BY month;