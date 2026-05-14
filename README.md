# SQL Exploratory Data Analysis: Retail & Inventory Performance

## Project Overview
This project focuses on performing an **Exploratory Data Analysis (EDA)** on a retail dataset stored in a SQL Server environment. Using a **Star Schema (Gold Layer)**, I explored customer demographics, product categories, and sales performance to extract actionable business insights.

The goal was to move from basic data retrieval to complex magnitude and ranking analysis, providing a clear picture of the business's health while maintaining a **clean and human-readable** code structure.

---

## Database Schema
The analysis is performed on the `gold` schema, focusing on:
* **`gold.fact_sales`**: Transactional data (sales, quantity, price, shipping dates).
* **`gold.dim_customers`**: Customer attributes (country, customer keys).
* **`gold.dim_products`**: Product details (category, subcategory, costs).

---

## Key Analysis Phases

### 1. Metadata & Dimension Exploration
I began by auditing the schema to understand the available attributes and unique values within the dimensions to ensure data integrity before deep-diving into metrics.

### 2. Time-Series Exploration
Understanding the data's lifecycle by analyzing shipping dates and product longevity.
* **Sales Range:** Determined the total timeline of sales in years and months.
* **Product Aging:** Calculated "Years till Today" for products to identify potential aging inventory.

### 3. Business Measures & KPIs
Developed a consolidated summary report using `UNION ALL` to aggregate core business metrics into a single view:
* **Total Sales & Quantity**
* **Average Selling Price (ASP)**
* **Unique Order & Customer Counts**

### 4. Magnitude Analysis
This phase involved analyzing how values are distributed across different segments to find high-impact areas:
* **Category Costs:** Identified which product categories carry the highest average production cost.
* **Revenue by Category:** Joined fact and dimension tables to see which categories drive the most income.
* **Geographic Distribution:** Analyzed item quantities sold by country to identify top-performing regions.

### 5. Ranking & Performance
Used **Window Functions** (like `ROW_NUMBER()`) and `TOP` clauses to isolate high and low performers:
* **Top 5 Products:** Identified the "Hero" products driving the most revenue.
* **Bottom 5 Products:** Highlighted underperforming products for potential inventory review.

---

## Tech Stack & SQL Techniques
* **Tool:** SQL Server (T-SQL)
* **Aggregations:** `SUM()`, `AVG()`, `COUNT(DISTINCT)`
* **Date Functions:** `DATEDIFF()`, `GETDATE()`, `MIN/MAX`
* **Joins:** `LEFT JOIN` for combining facts with descriptive dimensions.
* **Advanced Logic:** Window Functions (`ROW_NUMBER`) and Set Operators (`UNION ALL`).

---

## Key Insights
> Through Magnitude Analysis, I discovered that certain high-cost categories were underperforming in total revenue, suggesting a need for a shift in marketing strategy or a review of inventory margins for those specific lines.

---

## How to Run
1. Clone this repository.
2. Ensure you have a SQL Server environment with the `gold` schema.
3. Run the `SQL Exploratory Data Analysis Project.sql` script to see the results of each analysis phase.

---

## Let’s Connect
* **Portfolio:** [https://nimra-sultan-za9icja.gamma.site/]
* **LinkedIn:** [www.linkedin.com/in/nimra-sultan-1822043a3]
* **Vibe:** Always learning. Always optimizing.
