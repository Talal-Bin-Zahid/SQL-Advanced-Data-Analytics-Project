/* Performance Analysis (year on year , month on month)
 Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

 SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis. */

-- Analyze the yearly performance of products by comparing their sales 
-- Both the average sales performance of the product and the previous year's sales 

with yearly_product as (
select extract ( year from f.order_date) as order_year ,
p.product_name , Sum(f.sales_amount) As current_sales
from gold.fact_sales f 
left join gold.dim_products p 
on f.product_key = p.product_key 
where f.order_date is not null 
group by order_year , p.product_name 
)
select order_year, product_name , current_sales,
round (Avg(current_sales) over (Partition By product_name ),2) as avg_sales ,
current_sales - round (Avg(current_sales) over (Partition By product_name ),2)
as diff_avg
from yearly_product ;

-- Categorizing the sales by case statement 
with yearly_product as (
select extract ( year from f.order_date) as order_year ,
p.product_name , Sum(f.sales_amount) As current_sales
from gold.fact_sales f 
left join gold.dim_products p 
on f.product_key = p.product_key 
where f.order_date is not null 
group by order_year , p.product_name 
)
select order_year, product_name , current_sales,
round (Avg(current_sales) over (Partition By product_name ),2) as avg_sales ,
current_sales - round (Avg(current_sales) over (Partition By product_name ),2)
as diff_avg, 
Case when current_sales - round (Avg(current_sales) over (Partition By product_name ),2)
     > 0 Then 'Above Avg'
	 when current_sales - round (Avg(current_sales) over (Partition By product_name ),2)
	 < 0 Then 'Below Avg'
	 else 'Avg'
End avg_change ,
-- year on year analysis 
Lag (current_sales) over (Partition By product_name order by order_year) py_sales,
current_sales - Lag (current_sales) over (Partition By product_name order by order_year) diff_py ,
case when current_sales - Lag (current_sales) over (Partition By product_name order by order_year) 
     > 0 then 'Increase'
	 when current_sales - Lag (current_sales) over (Partition By product_name order by order_year) 
     < 0 then 'Decrease'
	 else 'No change'
End py_change 
from yearly_product 
order by product_name , order_year;

