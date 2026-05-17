-- ================================================
-- Superstore Sales Analysis
-- Author: Laura Rizka Amanda
-- Tools: MySQL
-- ================================================

USE superstore_db;

-- ================================================
-- 1. Total Revenue & Profit
-- ================================================
SELECT 
    ROUND(SUM(CAST(sales AS DECIMAL(10,2))), 2) AS total_revenue,
    ROUND(SUM(CAST(profit AS DECIMAL(10,2))), 2) AS total_profit
FROM orders;

-- ================================================
-- 2. Revenue per Category
-- ================================================
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(CAST(Profit AS DECIMAL(10,2))), 2) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;

-- ================================================
-- 3. Top 10 Best Selling Products
-- ================================================
SELECT 
    `Product Name`,
    SUM(Quantity) AS total_qty,
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- ================================================
-- 4. Revenue per Region
-- ================================================
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(CAST(Profit AS DECIMAL(10,2))), 2) AS total_profit
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;

-- ================================================
-- 5. Customer Segment Analysis
-- ================================================
SELECT 
    Segment,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(CAST(Profit AS DECIMAL(10,2))), 2) AS total_profit
FROM orders
GROUP BY Segment
ORDER BY total_sales DESC;

-- ================================================
-- 6. Top 5 Most Profitable Cities
-- ================================================
SELECT 
    City,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(CAST(Profit AS DECIMAL(10,2))), 2) AS total_profit
FROM orders
GROUP BY City
ORDER BY total_profit DESC
LIMIT 5;

-- ================================================
-- 7. Sub-Category Analysis
-- ================================================
SELECT 
    `Sub-Category`,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(CAST(Profit AS DECIMAL(10,2))), 2) AS total_profit,
    SUM(Quantity) AS total_qty
FROM orders
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;

-- ================================================
-- 8. Top 10 Customers by Revenue
-- ================================================
SELECT 
    `Customer Name`,
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(CAST(Profit AS DECIMAL(10,2))), 2) AS total_profit
FROM orders
GROUP BY `Customer Name`, Segment
ORDER BY total_sales DESC
LIMIT 10;
