CREATE DATABASE retail_sales_db;
USE retail_sales_db;

create table retailsales (transactions_id	int, sale_date date, sale_time time,
customer_id	int, gender varchar(15), age int, category varchar(25),
quantity int, price_per_unit float,
cogs float,
total_sale float );

SELECT COUNT(*) AS total_records
FROM retailsales;

SELECT SUM(total_sale) AS total_revenue
FROM retailsales;
SELECT COUNT(transactions_id) AS total_transactions
FROM retailsales;
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retailsales;
SELECT AVG(total_sale) AS avg_sale_value
FROM retailsales;
#GROUP BY ANALYSIS
SELECT category,
       SUM(total_sale) AS revenue
FROM retailsales
GROUP BY category
ORDER BY revenue DESC;
SELECT category,
       SUM(quantity) AS total_quantity
FROM retailsales
GROUP BY category;
#TOP / BOTTOM PERFORMERS
SELECT category,
       SUM(total_sale) AS revenue
FROM retailsales
GROUP BY category
ORDER BY revenue DESC
LIMIT 5;
#bottom
SELECT category,
       SUM(total_sale) AS revenue
FROM retailsales
GROUP BY category
ORDER BY revenue ASC
LIMIT 5;
#monthly Sales Trend
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month,
       SUM(total_sale) AS monthly_sales
FROM retailsales
GROUP BY month
ORDER BY month









