-- ============================================================
-- E-COMMERCE BUSINESS PERFORMANCE & CUSTOMER ANALYTICS
-- SQL Business Analysis
-- Database: SQLite
-- Source: Fuzzy Factory E-Commerce Dataset
-- ============================================================


-- ============================================================
-- Q1. Monthly Revenue Analysis
-- Objective: Analyze revenue trends month by month.
-- ============================================================

SELECT
    strftime('%Y-%m', created_at) AS month,
    ROUND(SUM(price_usd), 2) AS total_revenue
FROM orders
GROUP BY strftime('%Y-%m', created_at)
ORDER BY month;


-- ============================================================
-- Q2. Top 10 Performing Products
-- Objective: Identify products generating the highest revenue.
-- ============================================================

SELECT
    p.product_id,
    p.product_name,
    ROUND(SUM(oi.price_usd), 2) AS total_revenue,
    COUNT(oi.order_item_id) AS units_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- Q3. Seller-Wise Sales Analysis
-- Status: Not available.
-- Reason: The available dataset does not contain seller information.


-- ============================================================
-- Q4. Average Order Value (AOV)
-- Objective: Calculate total orders, revenue, and average order value.
-- ============================================================

SELECT
    COUNT(order_id) AS total_orders,
    ROUND(SUM(price_usd), 2) AS total_revenue,
    ROUND(AVG(price_usd), 2) AS average_order_value
FROM orders;


-- ============================================================
-- Q5. Customers with More Than One Order
-- Objective: Identify repeat customers.
-- ============================================================

SELECT
    user_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC, user_id;


-- ============================================================
-- Q6. Repeat Customer Percentage
-- Objective: Calculate the percentage of customers
-- who placed more than one order.
-- ============================================================

SELECT
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN order_count > 1 THEN 1
            ELSE 0
        END
    ) AS repeat_customers,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN order_count > 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS repeat_customer_percentage

FROM (
    SELECT
        user_id,
        COUNT(DISTINCT order_id) AS order_count
    FROM orders
    GROUP BY user_id
) AS customer_summary;


-- ============================================================
-- Q7. Orders with Delivery Delays
-- Status: Not available.
-- Reason: Delivery date information is not available
-- in the provided dataset.


-- ============================================================
-- Q8. State-Wise Sales / Customer Analysis
-- Status: Not available.
-- Reason: State-level geographic information is not available
-- in the provided dataset.


-- ============================================================
-- Q9. Product Review Rating Analysis
-- Status: Not available.
-- Reason: Product review and rating information is not
-- available in the provided dataset.


-- ============================================================
-- Q10. Month-over-Month Revenue Growth
-- Objective: Calculate monthly revenue and compare it
-- with the previous month's revenue.
-- ============================================================

WITH monthly_revenue AS (
    SELECT
        strftime('%Y-%m', created_at) AS month,
        SUM(price_usd) AS total_revenue
    FROM orders
    GROUP BY strftime('%Y-%m', created_at)
),

revenue_comparison AS (
    SELECT
        month,
        total_revenue,
        LAG(total_revenue) OVER (
            ORDER BY month
        ) AS previous_month_revenue
    FROM monthly_revenue
)

SELECT
    month,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(previous_month_revenue, 2) AS previous_month_revenue,
    ROUND(
        (total_revenue - previous_month_revenue)
        * 100.0 / NULLIF(previous_month_revenue, 0),
        2
    ) AS monthly_growth_percentage
FROM revenue_comparison
ORDER BY month;


-- ============================================================
-- Q11. Users with Website Sessions but No Recorded Orders
-- Objective: Identify users who have website sessions
-- but no recorded orders in the available orders table.
-- ============================================================

SELECT
    ws.user_id,
    COUNT(DISTINCT ws.website_session_id) AS total_sessions
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.user_id = o.user_id
WHERE o.user_id IS NULL
GROUP BY ws.user_id
ORDER BY total_sessions DESC, ws.user_id;

-- Note:
-- This identifies users with no recorded orders in the
-- available dataset. It does not establish that these
-- users have never purchased outside the observed data.


-- ============================================================
-- Q12. Overall E-Commerce Business Performance KPIs
-- Objective: Calculate key business metrics including
-- revenue, costs, profit, refunds, AOV, and profit margin.
-- ============================================================

WITH refund_summary AS (
    SELECT
        order_item_id,
        SUM(refund_amount_usd) AS refund_amount
    FROM order_item_refunds
    GROUP BY order_item_id
),

item_metrics AS (
    SELECT
        COUNT(oi.order_item_id) AS total_items,
        COUNT(DISTINCT oi.order_id) AS item_order_count,
        SUM(oi.price_usd) AS gross_revenue,
        SUM(oi.cogs_usd) AS total_cogs,
        SUM(oi.price_usd - oi.cogs_usd) AS gross_profit,
        SUM(COALESCE(r.refund_amount, 0)) AS total_refunds,
        COUNT(DISTINCT p.product_id) AS products_sold
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
    LEFT JOIN refund_summary r
        ON oi.order_item_id = r.order_item_id
),

order_metrics AS (
    SELECT
        COUNT(DISTINCT order_id) AS total_orders,
        COUNT(DISTINCT user_id) AS total_customers,
        SUM(price_usd) AS order_revenue,
        AVG(price_usd) AS average_order_value
    FROM orders
)

SELECT
    o.total_orders,
    o.total_customers,
    i.total_items,
    i.products_sold,
    ROUND(i.gross_revenue, 2) AS gross_revenue,
    ROUND(i.total_cogs, 2) AS total_cogs,
    ROUND(i.gross_profit, 2) AS gross_profit,
    ROUND(i.total_refunds, 2) AS total_refunds,
    ROUND(i.gross_revenue - i.total_refunds, 2) AS net_revenue,
    ROUND(o.average_order_value, 2) AS average_order_value,
    ROUND(
        100.0 * i.gross_profit / NULLIF(i.gross_revenue, 0),
        2
    ) AS gross_profit_margin_percentage,
    ROUND(
        100.0 * i.total_refunds / NULLIF(i.gross_revenue, 0),
        2
    ) AS refund_percentage
FROM order_metrics o
CROSS JOIN item_metrics i;

