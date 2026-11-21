# RetailMart Sales Analytics

An end-to-end retail data analytics project that simulates the work of a
Data Analyst in a retail organization. The project transforms seven
operational datasets into business-ready insights using **Python
(Pandas), PostgreSQL, SQL, and Power BI**.

The analysis covers sales performance, profitability, customers,
products, returns, inventory, employees, suppliers, and regional
performance. The final deliverable is an interactive four-page Power BI
dashboard designed to support management-level decision-making.

------------------------------------------------------------------------

## Table of Contents

-   [Business Problem](#business-problem)
-   [Project Objectives](#project-objectives)
-   [Dataset](#dataset)
-   [Tools and Technologies](#tools-and-technologies)
-   [End-to-End Workflow](#end-to-end-workflow)
-   [Python Analysis](#python-analysis)
-   [PostgreSQL and SQL Analysis](#postgresql-and-sql-analysis)
-   [Key Business KPIs](#key-business-kpis)
-   [Power BI Dashboard](#power-bi-dashboard)
-   [Key Business Insights](#key-business-insights)
-   [Business Recommendations](#business-recommendations)
-   [Repository Structure](#repository-structure)
-   [Skills Demonstrated](#skills-demonstrated)
-   [Project Outcome](#project-outcome)

------------------------------------------------------------------------

## Business Problem

RetailMart requires a consolidated analytical solution to understand its
business performance and identify opportunities for improvement.

The project addresses the following business questions:

-   How are overall sales, costs, and profits performing?
-   Which products, brands, and categories contribute most to revenue
    and profit?
-   Which customers and customer segments generate the highest
    contribution?
-   How does discounting relate to profitability?
-   What are the main reasons for product returns?
-   Which warehouses and products require inventory attention?
-   How does performance vary by month, year, and region?
-   Where can management take action to improve business performance?

**Objective:** Convert raw operational data into reliable analysis,
interactive reporting, and actionable business recommendations.

## Project Objectives

1.  Explore and validate multiple raw retail datasets.
2.  Clean and transform data using Python and Pandas.
3.  Analyze business performance, revenue, operations, and
    profitability.
4.  Load the cleaned datasets into a PostgreSQL relational database.
5.  Create database relationships and reusable SQL views.
6.  Solve **30 SQL business analysis questions**, progressing from
    beginner to advanced.
7.  Build an interactive Power BI data model and management dashboard.
8.  Communicate findings through business insights and recommendations.

## Dataset

The project uses seven CSV datasets:

  Dataset           Purpose
  ----------------- ---------------------------------------------------
  `orders.csv`      Customer order transactions
  `customers.csv`   Customer demographic and segmentation information
  `products.csv`    Product, category, brand, and pricing information
  `returns.csv`     Returned orders and return reasons
  `inventory.csv`   Warehouse stock and reorder levels
  `employees.csv`   Employee and regional information
  `suppliers.csv`   Supplier information

The datasets are organized into raw and processed folders to separate
source data from cleaned data.

## Tools and Technologies

  -----------------------------------------------------------------------
  Tool / Technology                   Usage
  ----------------------------------- -----------------------------------
  Python                              Data exploration, cleaning,
                                      transformation, and analysis

  Pandas                              Data manipulation, merging,
                                      grouping, and aggregation

  NumPy                               Numerical operations

  Matplotlib / Seaborn                Exploratory data visualization

  Jupyter Notebook                    Python analysis environment

  PostgreSQL                          Relational database and analytical
                                      data storage

  SQL                                 Joins, aggregations, CTEs, views,
                                      and window functions

  Power BI                            Data modeling, DAX measures, KPIs,
                                      and interactive dashboards

  Git & GitHub                        Version control and project
                                      documentation
  -----------------------------------------------------------------------

## End-to-End Workflow

``` text
Raw CSV Datasets (7 files)
          |
          v
Python / Pandas
          |
          v
Data Exploration & Validation
          |
          v
Data Cleaning & Transformation
          |
          v
Business, Revenue, Operations & Profit Analysis
          |
          v
Cleaned Data
          |
          v
PostgreSQL Database
          |
          v
Database Relationships & SQL Views
          |
          v
30 SQL Business Analysis Questions
          |
          v
Power BI Data Model & DAX Measures
          |
          v
Four-Page Interactive Dashboard
          |
          v
Business Insights & Recommendations
```

## Python Analysis

The Python stage is organized into five analytical Jupyter notebooks.

### 01 --- Data Exploration

Explored the raw datasets to understand:

-   Dataset dimensions and structures
-   Column names and data types
-   Missing values and duplicate records
-   Data quality issues
-   Relationships between datasets

### 02 --- Business Analysis

Analyzed the main business dimensions, including customers, products,
orders, and overall business performance.

### 03 --- Revenue Analysis

Analyzed revenue performance across products, categories, customers, and
geographic markets.

### 04 --- Operations Analysis

Analyzed operational performance, including:

-   Product returns and return reasons
-   Inventory levels and reorder requirements
-   Warehouse stock
-   Employee-related operations
-   Supplier-related operations

### 05 --- Profit Analysis

Created and analyzed the core financial metrics:

**Sales**

`Quantity × Selling Price × (1 − Discount / 100)`

**Cost**

`Quantity × Cost Price`

**Profit**

`Sales − Cost`

**Profit Margin (%)**

`(Profit / Sales) × 100`

Profitability was evaluated across products, categories, brands,
customers, segments, regions, and discount levels.

## PostgreSQL and SQL Analysis

The cleaned datasets were loaded into PostgreSQL to create a structured
relational analytical environment.

### Database Tables

-   `orders`
-   `customers`
-   `products`
-   `returns`
-   `inventory`
-   `employees`
-   `suppliers`

Primary keys and foreign keys were created where applicable to maintain
relationships between tables and support reliable analysis.

### SQL Views

Reusable SQL views were created for:

-   Customer orders
-   Sales analysis
-   Orders joined with products and customers
-   Returns analysis
-   Inventory status

### SQL Analysis --- 30 Questions Completed

**Completed all 30 SQL business analysis questions**, progressing from
beginner to advanced level.

The practice and analysis covered:

-   Basic SELECT statements and filtering
-   Sorting and distinct values
-   Aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
-   `GROUP BY` and `HAVING`
-   INNER JOIN and LEFT JOIN
-   Multi-table joins
-   Subqueries and common table expressions (CTEs)
-   UNION and UNION ALL
-   EXISTS and related filtering techniques
-   Window functions and ranking
-   `DENSE_RANK()`
-   Running totals
-   `LAG()` and `LEAD()`
-   Above-average customer analysis
-   Product ranking
-   Monthly sales and profit analysis

The 30 completed questions demonstrate the application of SQL to
practical retail business problems, not just isolated syntax exercises.

## Key Business KPIs

The following headline results are displayed in the Power BI report:

  KPI                       Result
  --------------------- ----------
  Total Sales             ₹396.99M
  Total Cost              ₹345.52M
  Total Profit             ₹51.47M
  Profit Margin             12.97%
  Total Orders               5,000
  Total Customers              100
  Average Order Value      ₹79.40K
  Total Returns                300
  Return Rate                6.00%

*Values are based on the project dataset and the report's displayed KPI
calculations.*

## Power BI Dashboard

The final Power BI report contains four interactive analytical pages.
Report-level slicers include Category, Year, and Region.

### 1. Executive Overview

Provides a management-level summary of business performance:

-   Total Sales, Total Profit, Profit Margin, Total Orders, Total
    Customers, and Return Rate
-   Monthly sales trend
-   Sales by product category
-   Profit by product category
-   Sales by region

### 2. Sales & Profit Performance

Provides deeper financial and product analysis:

-   Total Sales, Total Cost, Total Profit, Profit Margin, and Average
    Order Value
-   Monthly Sales vs. Profit Trend
-   Discount Impact on Profit
-   Top 10 Products by Profit
-   Profit by Brand
-   Sales vs. Profit by Product

### 3. Operations & Customer Insights

Focuses on customer contribution and operational performance:

-   Top customers by sales
-   Returns by reason
-   Sales by customer segment
-   Stock by warehouse
-   Product-level sales, profit, stock, reorder level, and profit margin
    information

### 4. Sales & Profit Trends

Provides month-wise and year-wise performance analysis:

-   Monthly sales trend
-   Monthly profit trend
-   Comparison of 2025 and 2026 where data is available
-   Month-wise sales and profit analysis

**Dashboard design:** Modern corporate styling with a navy and teal
color palette, consistent KPI cards, interactive slicers, and
chart-based analysis.

## Key Business Insights

### Overall Performance

RetailMart generated approximately **₹396.99M in sales** and **₹51.47M
in profit**, resulting in an overall profit margin of **12.97%**.

### Product Performance

Electronics is the strongest category, generating approximately **₹116M
in sales** and **₹18.74M in profit**. It contributes roughly **36.4% of
total company profit**.

Product-level analysis also identified differences in profitability,
including products with negative profitability.

### Regional Performance

The South region is the strongest market, generating approximately
**₹251M in sales** and **₹32.49M in profit**.

### Customer Performance

The VIP customer segment generates the highest contribution, with
approximately **₹148M in sales** and **₹19.35M in profit**.

The customer with the highest sales is not necessarily the customer with
the highest profit, highlighting the importance of evaluating both
measures.

### Discount Impact

The analysis indicates a negative association between higher discount
levels and profitability in the project dataset. Discount decisions
should therefore be evaluated using profit and margin, not sales alone.

### Returns

RetailMart recorded **300 returns**, representing a **6% return rate**.

Damaged products (79) and wrong-item deliveries (77) together account
for more than half of the recorded returns, making them important
operational improvement areas.

### Inventory

Inventory analysis identified products with stock below their reorder
thresholds. These products can be prioritized for replenishment to
reduce the risk of stockouts.

## Business Recommendations

1.  **Protect high-performing categories:** Maintain product
    availability and assortment in Electronics while monitoring its
    contribution to overall profitability.
2.  **Strengthen discount governance:** Evaluate discounts using
    margin-based rules rather than applying broad discount strategies.
3.  **Prioritize profitable customers:** Consider both sales and profit
    when identifying high-value customers for retention and loyalty
    initiatives.
4.  **Improve weaker regional markets:** Investigate customer mix,
    product demand, and sales performance in regions underperforming
    relative to the South.
5.  **Reduce preventable returns:** Improve packaging and handling to
    reduce damaged-product returns and strengthen picking and fulfilment
    accuracy to reduce wrong-item returns.
6.  **Monitor inventory proactively:** Use reorder thresholds to
    identify replenishment requirements before stockouts occur.
7.  **Review loss-making products:** Investigate pricing, costs,
    discounts, and demand for products generating negative or weak
    profitability.

## Repository Structure

``` text
RetailMart-Sales-Analytics/
│
├── data/
│   ├── raw/
│   │   ├── orders.csv
│   │   ├── customers.csv
│   │   ├── products.csv
│   │   ├── returns.csv
│   │   ├── inventory.csv
│   │   ├── employees.csv
│   │   └── suppliers.csv
│   │
│   └── processed/
│
├── notebooks/
│   ├── 01_Data_Exploration.ipynb
│   ├── 02_Business_Analysis.ipynb
│   ├── 03_Revenue_Analysis.ipynb
│   ├── 04_Operations_Analysis.ipynb
│   └── 05_Profit_Analysis.ipynb
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_import_data.sql
│   ├── 03_create_keys.sql
│   ├── 04_create_views.sql
│   └── 05_analysis_queries.sql
│
├── dashboard/
│   └── RetailMart_Sales_Analytics.pbix
│
├── screenshots/
│   ├── 01_Executive_Overview.png
│   ├── 02_Sales_Profit_Performance.png
│   ├── 03_Operations_Customer_Insights.png
│   └── 04_Monthly_Sales_Profit_Trends.png
│
├── README.md
└── requirements.txt
```

*Repository structure is a suggested layout; keep only files and folders
that are actually present in your GitHub repository. Add your actual
screenshot files to the `screenshots/` folder if you want them displayed
in the README.*

## Skills Demonstrated

-   Data exploration and validation
-   Data cleaning and transformation
-   Exploratory Data Analysis (EDA)
-   Data merging and feature engineering
-   Business KPI development
-   Revenue and profitability analysis
-   Customer and product analysis
-   Operational and inventory analysis
-   PostgreSQL database design
-   SQL joins, aggregations, CTEs, subqueries, and window functions
-   Solving 30 practical SQL business analysis questions
-   Data modeling and DAX measures
-   Interactive Power BI dashboard development
-   Business insight generation
-   Data-driven recommendations
-   Git and GitHub project documentation

## Project Outcome

This project demonstrates a complete end-to-end analytics workflow, from
raw operational data to management-level business intelligence.

It brings together Python-based data preparation and analysis,
PostgreSQL database implementation, 30 completed SQL business questions,
and a four-page interactive Power BI dashboard.

**The complete analytical lifecycle:**

`Data → Cleaning → Transformation → Analysis → PostgreSQL → SQL → Power BI → Business Decisions`

The project demonstrates practical skills required to investigate
business problems, work with relational data, build analytical reports,
and communicate insights that can support business decisions.
