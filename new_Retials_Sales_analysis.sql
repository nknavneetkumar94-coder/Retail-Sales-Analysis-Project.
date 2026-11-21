'''

-# Retail_Sales_Analytics – SQL Project

--## Project Overview

--The SQL component of RetailMart Sales Analytics focuses on database preparation, relational data management, data validation, and business analysis using PostgreSQL.

--The project uses seven retail datasets: Customers, Employees, Products, Orders, Returns, Inventory, and Suppliers.

--The SQL implementation includes inspecting and correcting database column data types, validating duplicate and NULL values, creating primary and foreign key constraints, and establishing relationships between tables.

--After database preparation, 30 SQL business analysis questions were completed, covering beginner, intermediate, and advanced SQL concepts.

--## Key Activities

--1. Database inspection and schema validation.
--2. Data type correction and standardization.
--3. Duplicate and NULL value identification.
--4. Primary and foreign key implementation.
5. Relational database validation.
6. Completion of 30 SQL business analysis questions.
7. Business performance and profitability analysis.

## SQL Topics Covered

- SELECT, WHERE, ORDER BY, DISTINCT, BETWEEN
- COUNT, SUM, AVG, MIN, MAX
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- Subqueries and CTEs
- UNION and UNION ALL
- CASE WHEN
- Window Functions
- RANK() and DENSE_RANK()
- LAG() and LEAD()
- Running Totals
- stomer spending and purchasing patterns
- Product and category revenue
- Regional sales performance
- Revenue, cost, and profitability
- Monthly sales trends
- Customer and employee performance
- Product returns
- Inventory and reorder requirements
- Most profitable products

## Project Outcome

Successfully completed the PostgreSQL database implementation and 30 practical SQL business analysis questions, demonstrating the ability to prepare relational datasets, maintain database relationships, write analytical queries, and extract business insights from retail data.

**Database:** PostgreSQL
**Project:** RetailMart Sales Analytics

- Monthly Revenue Growth
- Customer and Product Ranking

## Business Analysis

The SQL analysis addresses practical retail business questions involving:

- Cu
  **SQL Exercises:** 30 Completed
'''





--- First we will check the all tables columns data type 

SELECT
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;


---Important points:
-- TEXT: For IDs, names, cities and contact numbers.
-- INTEGER: For age, stock and reorder level.
-- DATE: For dates.
-- NUMERIC(12,2): For prices and monetary calculations.
-- NUMERIC(12,3): For quantities that may contain decimal values.


---1. Correct data types using SQL
--- Customers table 

ALTER TABLE customers
ALTER COLUMN "Age" TYPE INTEGER
USING "Age"::INTEGER;

ALTER TABLE customers
ALTER column "Join_Date" TYPE DATE
USING "Join_Date"::DATE;

ALTER TABLE customers
ALTER COLUMN "Gender" TYPE VARCHAR(20);

--- After Alter check data type of particular columns
SELECT * FROM customers;

--.Employees table  
SELECT * FROM employees; (-- NO change required)

---Inventory Table 
SELECT * FROM inventory;

ALTER TABLE inventory
ALTER COLUMN "Stock" TYPE INTEGER
USING "Stock"::INTEGER;

ALTER TABLE inventory
ALTER COLUMN "Reorder_Level" TYPE INTEGER
USING "Reorder_Level"::INTEGER;

--Orders Table
SELECT * FROM orders;

ALTER TABLE orders
ALTER COLUMN "Order_Date" TYPE DATE
USING "Order_Date"::DATE;

ALTER TABLE orders
ALTER COLUMN "Quantity" TYPE INTEGER
USING "Quantity"::INTEGER;

ALTER TABLE orders
ALTER COLUMN "Discount" TYPE NUMERIC(10,2)
USING "Discount"::NUMERIC(10,2);


---Products Table
SELECT * FROM products;

ALTER TABLE products
ALTER COLUMN "Cost_Price" TYPE NUMERIC(12,2)
USING "Cost_Price"::NUMERIC(12,2);

ALTER TABLE products
ALTER COLUMN "Selling_Price" TYPE NUMERIC(12,2)
USING "Selling_Price"::NUMERIC(12,2);

---Returns table
SELECT * FROM returns;

ALTER TABLE returns
ALTER COLUMN "Return_Date" TYPE DATE
USING "Return_Date"::DATE;

--Suppliers table
SELECT * FROM suppliers;


ALTER TABLE suppliers
ALTER COLUMN "Contact_No" TYPE TEXT
USING "Contact_No"::TEXT;

---after changeing check again all the tables data type 

SELECT 
     table_name,
	 column_name,
	 data_type
FROM information_schema.columns
WHERE table_schema='public'
ORDER BY table_name,ordinal_position;

---Step 1. Understand the relationships
---First, understand these two concepts:
--- PRIMARY KEY (PK): Uniquely identifies every row in a table. It cannot contain duplicate or NULL values.
--- FOREIGN KEY (FK): Connects one table with another table using a related column.


---Step 2. Check duplicate and Nulls Values

SELECT "Customer_ID",COUNT(*)
FROM customers
GROUP BY "Customer_ID"
HAVING COUNT(*)>1;

SELECT *
FROM customers
WHERE "Customer_ID" IS NULL;

SELECT "Employee_ID",COUNT(*)
FROM employees
GROUP BY "Employee_ID"
HAVING COUNT(*)>1;

SELECT *
FROM employees
WHERE "Employee_ID" IS NULL;


SELECT "Product_ID",COUNT(*)
FROM products
GROUP BY "Product_ID"
HAVING COUNT(*)>1;

SELECT *
FROM products
WHERE "Product_ID" IS NULL;


SELECT "Order_ID",COUNT(*)
FROM orders
GROUP BY "Order_ID"
HAVING COUNT(*)>1;

SELECT *
FROM orders
WHERE "Order_ID" IS NULL;

SELECT "Return_ID",COUNT(*)
FROM returns
GROUP BY "Return_ID"
HAVING COUNT(*)>1;

SELECT *
FROM returns
WHERE "Return_ID" IS NULL;

----Step 3. Create PRIMARY KEYS
ALTER TABLE customers
ADD PRIMARY KEY ("Customer_ID");

ALTER TABLE employees
ADD PRIMARY KEY ("Employee_ID");

ALTER TABLE orders
ADD PRIMARY KEY ("Order_ID");

ALTER TABLE products
ADD PRIMARY KEY ("Product_ID");

ALTER TABLE returns
ADD PRIMARY KEY ("Return_ID");

ALTER TABLE suppliers
ADD PRIMARY KEY ("Supplier_ID");

-- For inventory , use a composite primary key; Because one product might be stored in multiple warehouses.
-- Here, Product_ID alone cannot uniquely identify each row. The combination of Product_ID and Warehouse can.
ALTER TABLE inventory
ADD PRIMARY KEY ("Product_ID", "Warehouse");


---Step 4. Create FOREIGN KEYS

--1. Orders → Customers
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY ("Customer_ID")
REFERENCES customers("Customer_ID");

--2.Orders → Products
ALTER TABLE orders
ADD CONSTRAINT fk_orders_products
FOREIGN KEY ("Product_ID")
REFERENCES products("Product_ID");

--3.Orders → Employees
ALTER TABLE orders
ADD CONSTRAINT fk_orders_employees
FOREIGN KEY ("Employee_ID")
REFERENCES employees("Employee_ID");

--4.Products → Suppliers
ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY ("Supplier_ID")
REFERENCES suppliers("Supplier_ID");

--5. Inventory → Products

ALTER TABLE inventory 
ADD CONSTRAINT fk_inventory_products
FOREIGN KEY ("Product_ID")
REFERENCES products("Product_ID");

--6. Returns → Orders
CREATE TABLE order_master AS
SELECT DISTINCT "Order_ID"
FROM orders;

ALTER TABLE order_master
ADD PRIMARY KEY ("Order_ID");

ALTER TABLE returns
ADD CONSTRAINT fk_returns_orders
FOREIGN KEY ("Order_ID")
REFERENCES order_master("Order_ID");



SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.table_schema = 'public'
AND tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY')
ORDER BY tc.table_name;     


---Q1. Display all customer records.

SELECT * FROM customers;

--Q2. Find all customers belonging to Delhi

SElECT * FROM customers
where "City"='Delhi';

--Q3. Display all products with their selling prices in descending order

SELECT 
"Product_Name",
"Selling_Price"
FROM products
ORDER BY "Selling_Price" DESC;

--Find all unique product categories
SELECT * FROM products;

SELECT DISTINCT ("Category")
FROM products;

--Q5. Find customers whose age is between 25 and 35.

SELECT "Customer_Name","Age","City"
FROM customers
WHERE "Age" BETWEEN 25 AND 35
ORDER BY "Age" DESC;

--Intermediate SQL – 10 Questions

--Q6. Find the total number of customers in the database

SELECT COUNT(*) AS Total_Customers
FROM customers;

--Q7. Calculate total quantity of products sold

SELECT SUM("Quantity") AS total_quantity_sold
FROM ORDERS;

---Q8. Find the average selling price of all products.

SELECT ROUND(AVG("Selling_Price"),2) AS avg_selling_price
FROM products;

--Q9. Calculate total quantity sold for each product

SELECT p."Product_Name",
SUM(o."Quantity") AS total_sold_quanity
FROM orders AS o
INNER JOIN products AS p
ON o."Product_ID"=p."Product_ID"
GROUP BY p."Product_Name"
ORDER BY SUM(o."Quantity")  DESC;

--Q10. Find total sales for each product category

SELECT p."Category",
SUM(o."Quantity"*p."Selling_Price") AS total_sales
FROM orders AS o
JOIN products AS p
ON o."Product_ID"=p."Product_ID"
GROUP BY p."Category"
ORDER BY total_sales DESC;

--Q11. Find customers who have placed more than 5 order records
SELECT c."Customer_Name",
c."Customer_ID",
COUNT(o."Order_ID") AS total_order_lines
FROM customers AS c
INNER JOIN orders AS o
ON o."Customer_ID"=c."Customer_ID"
GROUP BY c."Customer_Name",c."Customer_ID"
HAVING COUNT(o."Order_ID")>5
ORDER BY total_order_lines DESC;


--Q12. Find total sales by region.

SELECT c."Region",
SUM(o."Quantity"*p."Selling_Price") AS total_sales

FROM orders AS o 

INNER JOIN customers as c
on o."Customer_ID"=c."Customer_ID"
INNER JOIN products as p 
on o."Product_ID"=p."Product_ID"

GROUP BY c."Region"
ORDER BY total_sales DESC;

--Q13. Find products that have never been sold

SELECT 
p."Product_Name",
p."Product_ID"
FROM orders AS o
LEFT JOIN products AS P
ON p."Product_ID"=o."Product_ID"
WHERE p."Product_ID" IS NULL;

--Q14. Find total sales for each payment method.

SELECT o."Payment_Method",
SUM(o."Quantity"*p."Selling_Price") AS total_sales
FROM orders AS o
JOIN products AS p
ON o."Product_ID"=p."Product_ID"
GROUP BY o."Payment_Method"
ORDER BY total_sales DESC;

--Q15. Find products whose total sales quantity is greater than 100.

SELECT 
p."Product_Name",
SUM(o."Quantity") AS total_quantity
FROM products AS p
INNER JOIN orders AS o
ON p."Product_ID" = o."Product_ID"
GROUP BY p."Product_Name"
HAVING SUM(o."Quantity")>100
ORDER BY total_quantity DESC;


--Level 3: Advanced SQL – 15 Questions

--Q16. Find the top 5 highest-selling products by revenue
SELECT p."Product_Name",
p."Product_ID",
SUM(o."Quantity"*p."Selling_Price") AS total_sales
FROM orders AS o
JOIN products AS p
ON o."Product_ID"=p."Product_ID"
GROUP BY p."Product_Name",
p."Product_ID"
ORDER BY total_sales DESC LIMIT 5;

--Q17. Calculate total revenue, total cost and profit.
SELECT 
SUM(o."Quantity"*p."Selling_Price") AS total_revenue,
SUM(p."Cost_Price") AS total_cost,
SUM(o."Quantity" *
        (p."Selling_Price" - p."Cost_Price")) AS Total_Profit
FROM orders AS o
JOIN products AS p
ON o."Product_ID"=p."Product_ID";

--Q18. Calculate profit margin percentage for each category.

SELECT p."Category",
ROUND (SUM(o."Quantity" *
        (p."Selling_Price" - p."Cost_Price"))/NULLIF (SUM(o."Quantity"*p."Selling_Price"),0)*100,2) AS profit_margin
FROM orders AS o
INNER JOIN products AS p 
ON o."Product_ID"=p."Product_ID"
GROUP BY p."Category"
ORDER BY profit_margin DESC;
		
--Q19. Find the second-highest selling product price.

SELECT MAX("Selling_Price") AS second_highest_price
FROM products 
WHERE "Selling_Price"<(
      SELECT MAX("Selling_Price")
	  FROM products
);


--Q20. Find customers whose spending is greater than average customer spending.


WITH Customer_Sales 

AS (
SELECT c."Customer_ID",
c."Customer_Name",
SUM(o."Quantity" * p."Selling_Price") AS Total_Spending
FROM customers AS c
INNER JOIN orders AS o
ON c."Customer_ID"=o."Customer_ID"
INNER JOIN products AS p
ON o."Product_ID"=p."Product_ID"
GROUP BY c."Customer_ID",
c."Customer_Name"

)

SELECT * 
FROM Customer_Sales
WHERE Total_Spending >(SELECT 
                            AVG(Total_Spending)
							FROM Customer_Sales
)
ORDER BY Total_Spending DESC;


--Q21. Find the monthly sales revenue

SELECT
    DATE_TRUNC('month', o."Order_Date")::DATE AS sales_month,
    SUM(o."Quantity" * p."Selling_Price") AS monthly_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o."Product_ID" = p."Product_ID"
GROUP BY DATE_TRUNC('month', o."Order_Date")
ORDER BY sales_month;
   
--Q22. Find the top 3 customers by total spending in each region

WITH Customer_Sales AS
(
    SELECT
        c."Customer_ID",
        c."Customer_Name",
        c."Region",
        SUM(o."Quantity" * p."Selling_Price") AS total_spending
    FROM customers AS c
    JOIN orders AS o
        ON c."Customer_ID" = o."Customer_ID"
    JOIN products AS p
        ON o."Product_ID" = p."Product_ID"
    GROUP BY
        c."Customer_ID",
        c."Customer_Name",
        c."Region"
),

Ranked_Customers AS
(
    SELECT *,
        DENSE_RANK() OVER(
            PARTITION BY "Region"
            ORDER BY total_spending DESC
        ) AS customer_rank
    FROM Customer_Sales
)

SELECT *
FROM Ranked_Customers
WHERE customer_rank <= 3
ORDER BY "Region", customer_rank;

--Q23. Find products whose revenue is greater than the average product revenue

WITH Product_Revenue AS
(
    SELECT
        p."Product_ID",
        p."Product_Name",
        SUM(o."Quantity" * p."Selling_Price") AS total_revenue
    FROM products AS p
    JOIN orders AS o
        ON p."Product_ID" = o."Product_ID"
    GROUP BY
        p."Product_ID",
        p."Product_Name"
)

SELECT *
FROM Product_Revenue
WHERE total_revenue >
(
    SELECT AVG(total_revenue)
    FROM Product_Revenue
)
ORDER BY total_revenue DESC;

--Q24. Calculate running total of monthly sales

WITH Monthly_Sales AS
(
    SELECT
        DATE_TRUNC('month', o."Order_Date")::DATE AS sales_month,
        SUM(o."Quantity" * p."Selling_Price") AS monthly_revenue
    FROM orders AS o
    JOIN products AS p
        ON o."Product_ID" = p."Product_ID"
    GROUP BY DATE_TRUNC('month', o."Order_Date")
)

SELECT
    sales_month,
    monthly_revenue,
    SUM(monthly_revenue) OVER(
        ORDER BY sales_month
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM Monthly_Sales
ORDER BY sales_month;

--Q25. Find customers who have never returned any orders

SELECT
    c."Customer_ID",
    c."Customer_Name"
FROM customers AS c
LEFT JOIN orders AS o
    ON c."Customer_ID" = o."Customer_ID"
LEFT JOIN returns AS r
    ON o."Order_ID" = r."Order_ID"
WHERE r."Return_ID" IS NULL
GROUP BY
    c."Customer_ID",
    c."Customer_Name"
ORDER BY c."Customer_Name";

--Q26. Calculate the return percentage for each product

SELECT
    p."Product_ID",
    p."Product_Name",
    COUNT(DISTINCT o."Order_ID") AS total_orders,
    COUNT(DISTINCT r."Return_ID") AS total_returns,

    ROUND(
        COUNT(DISTINCT r."Return_ID")::NUMERIC
        / NULLIF(COUNT(DISTINCT o."Order_ID"), 0)
        * 100, 2
    ) AS return_percentage

FROM products AS p
LEFT JOIN orders AS o
    ON p."Product_ID" = o."Product_ID"
LEFT JOIN returns AS r
    ON o."Order_ID" = r."Order_ID"

GROUP BY
    p."Product_ID",
    p."Product_Name"

ORDER BY return_percentage DESC NULLS LAST;

--Q27. Find employees who generated the highest sales revenue

WITH Employee_Sales AS
(
    SELECT
        e."Employee_ID",
        e."Employee_Name",
        SUM(o."Quantity" * p."Selling_Price") AS total_revenue
    FROM employees AS e
    JOIN orders AS o
        ON e."Employee_ID" = o."Employee_ID"
    JOIN products AS p
        ON o."Product_ID" = p."Product_ID"
    GROUP BY
        e."Employee_ID",
        e."Employee_Name"
)

SELECT *,
    RANK() OVER(
        ORDER BY total_revenue DESC
    ) AS sales_rank
FROM Employee_Sales
ORDER BY sales_rank;

--Q28. Identify products that need restocking

SELECT
    p."Product_ID",
    p."Product_Name",
    i."Warehouse",
    i."Stock",
    i."Reorder_Level",

    CASE
        WHEN i."Stock" = 0 THEN 'Out of Stock'
        WHEN i."Stock" < i."Reorder_Level" THEN 'Reorder Required'
        ELSE 'Sufficient Stock'
    END AS stock_status

FROM inventory AS i
JOIN products AS p
    ON i."Product_ID" = p."Product_ID"

WHERE i."Stock" <= i."Reorder_Level"

ORDER BY i."Stock" ASC;


--Q29. Calculate month-over-month revenue growth percentage


WITH Monthly_Sales AS
(
    SELECT
        DATE_TRUNC('month', o."Order_Date")::DATE AS sales_month,
        SUM(o."Quantity" * p."Selling_Price") AS monthly_revenue
    FROM orders AS o
    JOIN products AS p
        ON o."Product_ID" = p."Product_ID"
    GROUP BY DATE_TRUNC('month', o."Order_Date")
),

Previous_Month AS
(
    SELECT
        sales_month,
        monthly_revenue,

        LAG(monthly_revenue) OVER(
            ORDER BY sales_month
        ) AS previous_month_revenue

    FROM Monthly_Sales
)

SELECT
    sales_month,
    monthly_revenue,
    previous_month_revenue,

    ROUND(
        (monthly_revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100,
        2
    ) AS growth_percentage

FROM Previous_Month
ORDER BY sales_month;



--Q30. Find the most profitable product in each category

WITH Product_Profit AS
(
    SELECT
        p."Product_ID",
        p."Product_Name",
        p."Category",

        SUM(
            o."Quantity" *
            (p."Selling_Price" - p."Cost_Price")
        ) AS total_profit

    FROM products AS p
    JOIN orders AS o
        ON p."Product_ID" = o."Product_ID"

    GROUP BY
        p."Product_ID",
        p."Product_Name",
        p."Category"
),

Ranked_Products AS
(
    SELECT *,
        DENSE_RANK() OVER(
            PARTITION BY "Category"
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM Product_Profit
)

SELECT *
FROM Ranked_Products
WHERE profit_rank = 1
ORDER BY "Category";


















