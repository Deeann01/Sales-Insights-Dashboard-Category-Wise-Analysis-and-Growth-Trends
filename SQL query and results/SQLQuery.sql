CREATE TABLE df_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_id VARCHAR(50),
	quantity INT,
	discount decimal(7,2),
	sale_price decimal(7,2),
	profit decimal(7,2)
);
drop table Orders
select * from df_orders


--1. Top 10 highest revenue generating products
select top 10 product_id,sum(sale_price) as sales
from df_orders
group by product_id
order by sales desc


--2. find the top 5 highest selling products in each region
WITH cte AS (
    SELECT 
        region,
        product_id,
        SUM(sale_price) AS sales
    FROM df_orders
    GROUP BY region, product_id
),
ranked_sales AS (
    SELECT 
        region,
        product_id,
        sales,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY sales DESC) AS rn
    FROM cte
)
SELECT region, product_id, sales
FROM ranked_sales
WHERE rn <= 5;


---3. Month over month growth comparison for 2022 and 2023 sales eg: jan 2022 vs jan 2023
WITH monthly_sales AS (
    SELECT 
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(sale_price) AS total_sales
    FROM df_orders
    WHERE YEAR(order_date) IN (2022, 2023)
    GROUP BY YEAR(order_date), MONTH(order_date)
),
sales_comparison AS (
    SELECT 
        a.order_month,
        MAX(CASE WHEN a.order_year = 2022 THEN a.total_sales ELSE 0 END) AS sales_2022,
        MAX(CASE WHEN a.order_year = 2023 THEN a.total_sales ELSE 0 END) AS sales_2023,
        (MAX(CASE WHEN a.order_year = 2023 THEN a.total_sales ELSE 0 END) - 
         MAX(CASE WHEN a.order_year = 2022 THEN a.total_sales ELSE 0 END)) AS growth,
        ((MAX(CASE WHEN a.order_year = 2023 THEN a.total_sales ELSE 0 END) - 
          MAX(CASE WHEN a.order_year = 2022 THEN a.total_sales ELSE 0 END)) * 100.0 /
          NULLIF(MAX(CASE WHEN a.order_year = 2022 THEN a.total_sales ELSE 0 END), 0)) AS growth_percentage
    FROM monthly_sales a
    GROUP BY a.order_month
)
SELECT 
    order_month,
    sales_2022,
    sales_2023,
    growth,
    growth_percentage
FROM sales_comparison
ORDER BY order_month;




--4. categorywise Highest sales month
WITH category_monthly_sales AS (
    SELECT 
        category,
        MONTH(order_date) AS order_month,
        SUM(sale_price) AS total_sales
    FROM df_orders
    GROUP BY category, MONTH(order_date)
),
ranked_sales AS (
    SELECT 
        category,
        order_month,
        total_sales,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_sales DESC) AS rn
    FROM category_monthly_sales
)
SELECT 
    category,
    order_month,
    total_sales
FROM ranked_sales
WHERE rn = 1
ORDER BY category;

----5. sub categorythat has highest growth by profit in 2023 to 2022
WITH yearly_profit AS (
    SELECT 
        sub_category,
        YEAR(order_date) AS order_year,
        SUM(profit) AS total_profit
    FROM df_orders
    WHERE YEAR(order_date) IN (2022, 2023)
    GROUP BY sub_category, YEAR(order_date)
),
profit_growth AS (
    SELECT 
        sub_category,
        MAX(CASE WHEN order_year = 2023 THEN total_profit ELSE 0 END) AS profit_2023,
        MAX(CASE WHEN order_year = 2022 THEN total_profit ELSE 0 END) AS profit_2022,
        MAX(CASE WHEN order_year = 2023 THEN total_profit ELSE 0 END) - 
        MAX(CASE WHEN order_year = 2022 THEN total_profit ELSE 0 END) AS profit_growth
    FROM yearly_profit
    GROUP BY sub_category
)
SELECT TOP 1
    sub_category,
    profit_2023,
    profit_2022,
    profit_growth
FROM profit_growth
ORDER BY profit_growth DESC;

