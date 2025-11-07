# SQL-Advanced-Data-Analytics-Project

📊
Created by: Dr. Talal Bin Zahid
Date: 06 , November 2025


---

🧠 Project Overview

This project demonstrates Advanced Data Analytics using SQL (PostgreSQL) — from data modeling to analytical reporting.

It focuses on performing multi-dimensional business analysis using SQL functions and techniques such as time-series analysis, cumulative and performance analytics, segmentation, and reporting through views.

The dataset used in this project simulates a retail business environment, including customers, products, and sales transactions.


🏗️ Database Setup

Schema & Tables

A dedicated schema named gold was created containing three main tables:

dim_customers – Customer demographic and identification data

dim_products – Product details, categories, and cost information

fact_sales – Transactional sales data including orders, revenue, and quantities


Data Import

Data was imported into the tables using PostgreSQL’s \copy command from CSV files.


🔍 Analytical Modules

1️⃣ Change Over Time Analysis

Purpose: Track trends, growth, and changes in sales performance over time using SQL date and aggregate functions.

Key Insights:

Highest number of orders were in 2023.

12th December 2023 recorded the highest one-day sale at $96,600.

Across all years, December consistently achieved the highest monthly sales.


2️⃣ Cumulative Analysis

Purpose: Understand long-term growth patterns by calculating running totals and moving averages.

Key Insights:

Cumulative total sales (Dec 2010 – Jan 2014): $29,351,258

Yearly cumulative sales:

2011 → $7,075,088

2012 → $5,842,231

2013 → Highest with $16,344,878

2014 → $45,642 (only January sales)


3️⃣ Performance Analysis

Purpose: Benchmark product performance and identify growth or decline using window functions like LAG() and AVG() OVER().

Key Insight:

Bikes contributed the highest sales volume, indicating they are the company’s strongest product line.

Recommendation: While leveraging this success, diversify product offerings to reduce dependency risk.


4️⃣ Part-to-Whole (Proportional) Analysis

Purpose: Understand contribution of each category to overall business performance.

Key Insights:

Category	Sales ($)	Percentage

Bikes	28,316,272	96.5%
Accessories	700,262	2.4%
Clothing	339,716	1.1%


➡️ Conclusion: The business is heavily concentrated in the Bikes category, requiring diversification to ensure stability.


5️⃣ Data Segmentation Analysis

Purpose: Segment data into meaningful groups for targeted insights and behavioral understanding.

Highlights:

Products segmented by cost ranges: <100, 100–500, 500–1000, and >1000.

Customers segmented by spending behavior and lifespan:

VIP: ≥ 12 months & > $5,000 spending

Regular: ≥ 12 months & ≤ $5,000 spending

New: < 12 months lifespan


Provides clear visibility into customer retention and value contribution.


🧾 Analytical Reports

🧍‍♂️ Customer Report

Purpose: Consolidate customer-level metrics and segmentations for visualization and insights.

Report Features:

Combines demographic data and purchase history.

Calculates key KPIs:

Total orders, total sales, total products purchased

Lifespan (in months), recency, average order value (AOV), and average monthly spend


Segments customers by Age Groups and Customer Type (VIP, Regular, New).

Created as a reusable SQL view: gold.customers_report, enabling visualization teams to directly query clean, aggregated data.


📦 Product Report

Purpose: Summarize product-level performance and profitability.

Report Features:

Aggregates total sales, orders, quantity sold, customers, and lifespan.

Calculates KPIs:

Recency (months since last sale)

Average order revenue (AOR)

Average monthly revenue


Segments products into:

High-Performer: Sales > $50,000

Mid-Range: Sales between $10,000–$50,000

Low-Performer: Sales < $10,000


View created as gold.products_report for easy dashboard integration.

🧩 SQL Concepts Demonstrated

Category	Key Functions Used

Date/Time Analysis	DATE_TRUNC(), EXTRACT(), TO_CHAR()

Aggregation	SUM(), COUNT(), AVG()

Cumulative & Window Analysis	SUM() OVER(), AVG() OVER(), LAG()

Conditional Logic	CASE WHEN

Segmentation & Ranking	PARTITION BY, ORDER BY

Data Structuring	CTEs (WITH), VIEW creation

📈 Key Takeaways

SQL can serve as a complete analytical environment — not just for querying, but for trend analysis, segmentation, and KPI generation.

Analytical views (customers_report, products_report) make downstream visualization effortless in BI tools like Power BI, Tableau, or Looker Studio.

The approach builds a strong foundation for data-driven decision making, customer profiling, and product performance optimization.
