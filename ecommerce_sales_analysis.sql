```sql
-- ============================================================
-- E-COMMERCE SALES ANALYSIS
-- Database: eCommerce_db
-- Tool: MySQL
-- ============================================================


-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================

CREATE DATABASE eCommerce_db;
USE eCommerce_db;


-- ============================================================
-- 2. DATA UNDERSTANDING & STRUCTURE VALIDATION
-- ============================================================

DESCRIBE customers;
DESCRIBE Products;
DESCRIBE Orders;
DESCRIBE OrderDetails;


-- ============================================================
-- 3. DATA CLEANING
-- Rename incorrectly encoded column names caused by BOM/encoding
-- issues in the imported CSV files.
-- ============================================================

ALTER TABLE customers
RENAME COLUMN ï»¿customer_id TO customer_id;

ALTER TABLE Products
RENAME COLUMN ï»¿product_id TO product_id;

ALTER TABLE Orders
RENAME COLUMN ï»¿order_id TO order_id;

ALTER TABLE OrderDetails
RENAME COLUMN ï»¿order_id TO order_id;


-- Verify the corrected table structures

DESCRIBE customers;
DESCRIBE Products;
DESCRIBE Orders;
DESCRIBE OrderDetails;


-- ============================================================
-- 4. MARKET SEGMENT ANALYSIS
-- Identify the top three locations based on customer count.
-- ============================================================

SELECT
    location,
    COUNT(*) AS Number_of_Customers
FROM customers
GROUP BY location
ORDER BY Number_of_Customers DESC
LIMIT 3;

-- Insight:
-- Top customer locations: Delhi, Chennai and Jaipur.


-- ============================================================
-- 5. CUSTOMER ENGAGEMENT DEPTH ANALYSIS
-- Analyze how many orders customers have placed and
-- understand the distribution of customer order frequency.
-- ============================================================

WITH order_frequency AS (
    SELECT
        customer_id,
        COUNT(*) AS NumberOfOrders
    FROM Orders
    GROUP BY customer_id
)
SELECT
    NumberOfOrders,
    COUNT(*) AS CustomerCount
FROM order_frequency
GROUP BY NumberOfOrders
ORDER BY NumberOfOrders;


-- ============================================================
-- 6. HIGH-VALUE PRODUCT PURCHASE ANALYSIS
-- Identify products with an average purchase quantity of 2
-- and rank them by generated revenue.
-- ============================================================

SELECT
    product_id,
    AVG(quantity) AS AvgQuantity,
    SUM(quantity * price_per_unit) AS TotalRevenue
FROM OrderDetails
GROUP BY product_id
HAVING AVG(quantity) = 2
ORDER BY TotalRevenue DESC;


-- ============================================================
-- 7. CATEGORY-WISE CUSTOMER REACH
-- Measure the number of unique customers purchasing from
-- each product category.
-- ============================================================

SELECT
    p.category AS Category,
    COUNT(DISTINCT o.customer_id) AS UniqueCustomers
FROM Products p
JOIN OrderDetails od
    ON p.product_id = od.product_id
JOIN Orders o
    ON od.order_id = o.order_id
GROUP BY p.category
ORDER BY UniqueCustomers DESC;


-- ============================================================
-- 8. MONTHLY SALES TREND ANALYSIS
-- Calculate monthly sales and month-over-month percentage
-- change in sales.
-- ============================================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS Month,
        SUM(total_amount) AS TotalSales
    FROM Orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    Month,
    TotalSales,
    ROUND(
        (
            (TotalSales - LAG(TotalSales) OVER (ORDER BY Month))
            / LAG(TotalSales) OVER (ORDER BY Month)
        ) * 100,
        2
    ) AS PercentChange
FROM monthly_sales;

-- Insight:
-- Sales fluctuated across months without a consistent trend.
-- The largest decline was observed in February 2024.


-- ============================================================
-- 9. AVERAGE ORDER VALUE FLUCTUATION
-- Compare monthly Average Order Value (AOV) with the
-- previous month's AOV.
-- ============================================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS Month,
        ROUND(AVG(total_amount), 2) AS AvgOrderValue
    FROM Orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    Month,
    AvgOrderValue,
    ROUND(
        AvgOrderValue - LAG(AvgOrderValue) OVER (ORDER BY Month),
        2
    ) AS ChangeInValue
FROM monthly_sales
ORDER BY ChangeInValue DESC;

-- Insight:
-- The highest month-over-month change in Average Order Value
-- was observed in December.


-- ============================================================
-- 10. PRODUCT SALES FREQUENCY / INVENTORY TURNOVER
-- Identify the products with the highest sales frequency.
-- ============================================================

SELECT
    product_id,
    COUNT(*) AS SalesFrequency
FROM OrderDetails
GROUP BY product_id
ORDER BY SalesFrequency DESC
LIMIT 5;

-- Insight:
-- Product ID 7 recorded the highest sales frequency.


-- ============================================================
-- 11. LOW-ENGAGEMENT PRODUCTS
-- Identify products purchased by fewer than 40% of the
-- total customer base.
-- ============================================================

WITH product_customer_count AS (
    SELECT
        p.product_id AS ProductID,
        p.name AS ProductName,
        COUNT(DISTINCT o.customer_id) AS UniqueCustomerCount
    FROM Products p
    JOIN OrderDetails od
        ON p.product_id = od.product_id
    JOIN Orders o
        ON od.order_id = o.order_id
    GROUP BY p.product_id, p.name
)
SELECT
    ProductID,
    ProductName,
    UniqueCustomerCount
FROM product_customer_count
WHERE UniqueCustomerCount < (
    SELECT COUNT(*) FROM customers
) * 0.40
ORDER BY ProductID, ProductName;

-- Business Insight:
-- Products with low customer reach may indicate limited
-- visibility or weak customer awareness.
--
-- Potential Action:
-- Consider targeted marketing campaigns to increase
-- product awareness and customer engagement.


-- ============================================================
-- 12. CUSTOMER ACQUISITION TRENDS
-- Identify the number of new customers acquired each month
-- based on their first recorded purchase.
-- ============================================================

WITH first_purchase AS (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(order_date), '%Y-%m') AS FirstPurchaseMonth
    FROM Orders
    GROUP BY customer_id
)
SELECT
    FirstPurchaseMonth,
    COUNT(DISTINCT customer_id) AS TotalNewCustomers
FROM first_purchase
GROUP BY FirstPurchaseMonth
ORDER BY FirstPurchaseMonth ASC;

-- Insight:
-- The analysis shows a downward trend in new customer acquisition,
-- suggesting that customer acquisition activity may require
-- further investigation.


-- ============================================================
-- 13. PEAK SALES PERIOD IDENTIFICATION
-- Identify the three months with the highest total sales.
-- ============================================================

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS Month,
    SUM(total_amount) AS TotalSales
FROM Orders
GROUP BY 1
ORDER BY TotalSales DESC
LIMIT 3;

-- Business Use:
-- Peak sales periods can help with inventory planning,
-- marketing campaigns and resource allocation.


-- ============================================================
-- END OF ANALYSIS
-- ============================================================
```
