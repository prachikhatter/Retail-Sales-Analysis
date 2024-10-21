-- SQL Retail Sales Analysis
select * from retail_sales;

Select count(*) from retail_sales;

select * from retail_sales
where transactions_id is null
or sale_date is null
or sale_time is null
or customer_id is null
or gender is null
or age is null
or category is null
or quantity is null
or price_per_unit is null
or cogs is null
or total_sale is null;


Select count(*) as total_sale from retail_sales;

Select count(distinct customer_id) as total_sale
from retail_sales;

Select distinct category from retail_sales;

select * from retail_sales
where sale_date = '2022-11-05';

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
	  and sale_date like '%11-2022';
      
Select category, sum(total_sale) as net_sale
from retail_sales
group by category;

Select category, 
Round(avg(age), 2) as Avg_age
from retail_sales
group by category;

Select* from retail_sales
where total_sale > 1000;

Select category, gender, 
count(*) as total_trans
from retail_sales
group by category, gender
order by 1;

Select sale_date,
SUM(total_sale) as Total_sale
from retail_sales
Group by 1
order by TOTAL_SALE DESC;

SELECT customer_id,
sum(total_sale) as Total_sale
from retail_sales
group by 1
order by 2 desc
limit 5;

SELECT category,
count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by 1
order by 2 desc;

WITH hourly_sale
as
(
SELECT *,
        CASE
         WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
         WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
         ELSE 'Evening'
	END AS Shift
    FROM retail_sales
    ) 
    Select shift,
    count(*) as total_orders
    from hourly_sale
    group by Shift;

SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, SUM(total_sale) AS total_sales 
    FROM retail_sales;
