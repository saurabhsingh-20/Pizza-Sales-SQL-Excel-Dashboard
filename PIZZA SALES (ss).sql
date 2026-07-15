select * from  pizza_sales

SELECT SUM(total_price) AS Total_Revenue  from pizza_sales

SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value FROM pizza_sales

SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales

SELECT COUNT(DISTINCT order_id) as Total_order from pizza_sales

SELECT  CAST(CAST (SUM(quantity) AS DECIMAL(10,2)) /
CAST (COUNT(DISTINCT order_id)AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_pizza_per_order from pizza_sales

--DAILY TREND
SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(DW,order_date) 


--HOURLY TREND

SELECT DATEPART(HOUR,order_time) as order_hours, COUNT(DISTINCT order_id) as Total_orders
from pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)

SELECT pizza_category,sum(total_price) as TOTAL_SALES, sum(total_price) * 100 / 
(SELECT	sum(total_price) from pizza_sales WHERE MONTH(order_date) =1) AS PCT
from pizza_sales
WHERE MONTH(order_date) =1
GROUP BY pizza_category

--size

SELECT pizza_size, CAST(sum(total_price) AS DECIMAL(10,2)) as TOTAL_SALES, CAST(sum(total_price) * 100 / 
(SELECT	sum(total_price) from pizza_sales ) AS DECIMAL(10,2)) AS PCT
from pizza_sales
WHERE DATEPART(quarter,order_date) = 1
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT  pizza_category, sum(quantity) as Total_pizza_sold from pizza_sales
GROUP BY pizza_category

SELECT TOP 5 pizza_name,sum(quantity) as Total_Pizzas_Sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity) ASC

SELECT TOP 5 pizza_name,sum(quantity) as Total_Pizzas_Sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity) DESC