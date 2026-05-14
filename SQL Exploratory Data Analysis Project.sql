SELECT * FROM INFORMATION_SCHEMA.TABLES;
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME= 'dim_customers';

-- Dimension Exploration
SELECT * FROM gold.dim_customers;
SELECT DISTINCT country AS 'Country' FROM gold.dim_customers;
SELECT * FROM gold.dim_products;
SELECT DISTINCT category AS 'Category' FROM gold.dim_products;
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products ORDER BY 1,2,3;


-- Date Exploration
SELECT MIN(shipping_date) AS 'FIRST',  MAX(shipping_date) AS 'LAST',
DATEDIFF(month, MIN(shipping_date), MAX(shipping_date)) AS 'Range'
FROM gold.fact_sales; 

SELECT MIN(shipping_date) AS 'FIRST',  MAX(shipping_date) AS 'LAST',
DATEDIFF(year, MIN(shipping_date), MAX(shipping_date)) AS 'Range'
FROM gold.fact_sales; 

SELECT MIN(start_date) AS 'MIN',
DATEDIFF(year, MIN(start_date), GETDATE()) AS 'Years till Today', 
DATEDIFF(month, MIN(start_date), GETDATE()) AS 'Months till Today',
DATEDIFF(day, MIN(start_date), GETDATE()) AS 'days till Today'
FROM gold.dim_products;

--Measure Exploration
SELECT SUM(sales_amount) AS 'TOTAL SALES'  FROM gold.fact_sales;
SELECT SUM(quantity) AS 'TOTAL QUANTITY'  FROM gold.fact_sales;
SELECT AVG(price) AS 'AVERAGE SELLING PRICE'  FROM gold.fact_sales;
SELECT COUNT(order_number) AS 'TOTAL ORDERS'  FROM gold.fact_sales;
SELECT COUNT(product_key) AS 'TOTAL PRODUCTS'  FROM gold.fact_sales;
SELECT COUNT(customer_key) AS 'TOTAL CUSTOMERS'  FROM gold.fact_sales;
SELECT COUNT(DISTINCT customer_key) AS 'TOTAL CUSTOMERS'  FROM gold.fact_sales;

--Report
SELECT 'Total Sales' AS Measure_Name, SUM(sales_amount) AS Measure_Value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Customers', COUNT(customer_key) FROM gold.dim_customers;

--Magnitude Analysis
SELECT AVG(cost) AS Average_Cost FROM gold.dim_products 
GROUP BY category ORDER BY Average_Cost DESC;
--revenue across categories
SELECT SUM(f.sales_amount) AS Revenue, p.category FROM gold.fact_sales f LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY category;
--distributions of sold items across contries
SELECT SUM(f.quantity) AS Revenue, c.country FROM gold.fact_sales f LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key
GROUP BY country ORDER BY Revenue ASC;

--Ranking Analysis
--Top 5 highest revenue products
SELECT TOP 5 SUM(f.sales_amount) AS Revenue, p.product_name FROM gold.fact_sales f LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY product_name ORDER BY Revenue DESC;
--Top 5 Worst revenue products
SELECT TOP 5 SUM(f.sales_amount) AS Revenue, p.product_name FROM gold.fact_sales f LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY product_name ORDER BY Revenue ASC;
--Rank
SELECT * FROM(
SELECT SUM(f.sales_amount) AS Revenue, p.product_name, ROW_NUMBER() over (ORDER BY SUM(f.sales_amount) Desc) as Rank
FROM gold.fact_sales f LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY product_name)t
WHERE Rank<=5;









