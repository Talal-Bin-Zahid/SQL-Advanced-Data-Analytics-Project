/* Data Segmentation Analysis

Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments. 
*/

/* Segment products into cost ranges and 
count how many products fall into each segment */

select product_key , product_name , cost , 
case when cost < 100 then 'Below 100'
     when cost between 100 and 500 then '100-500'
	 when cost between 500 and 1000 then '500-1000'
     else 'Above 1000'
end cost_range 
from gold.dim_products ;

-- number of products in a specific range 
with product_segments as (
select product_key , product_name , cost , 
case when cost < 100 then 'Below 100'
     when cost between 100 and 500 then '100-500'
	 when cost between 500 and 1000 then '500-1000'
     else 'Above 1000'
end cost_range 
from gold.dim_products
)
select cost_range , count(product_key) as total_products 
from product_segments 
group by cost_range
order by total_products DESC;

/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/

With customer_spending as (
SELECT 
  c.customer_key, 
  SUM(f.sales_amount) AS total_spending, 
  MIN(order_date) AS first_order,
  MAX(order_date) AS last_order,
  (DATE_PART('year', AGE(MAX(order_date), MIN(order_date))) * 12 +
   DATE_PART('month', AGE(MAX(order_date), MIN(order_date)))) AS lifespan
FROM gold.fact_sales f 
LEFT JOIN gold.dim_customers c 
  ON f.customer_key = c.customer_key
GROUP BY c.customer_key 
)
select customer_segment , COUNT(customer_key) as total_customers
from (
select customer_key ,
CASE when lifespan >= 12 and total_spending > 5000 then 'VIP'
     when lifespan >= 12 and total_spending <= 5000 then 'Regular'
	 Else 'New'
END customer_segment 
from customer_spending )
group by customer_segment 
order by total_customers DESC ;


