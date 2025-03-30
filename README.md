# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `sql_project_p1`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `sql_project_p1`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
IF OBJECT_ID(`sql_project_p1`.`retail_sales`, 'U') IS NOT NULL
    DROP TABLE retail_sales;
GO

CREATE TABLE `sql_project_p1`.`retail_sales` (
		transactions_id		INT PRIMARY KEY,
		sale_date			DATE,
		sale_time			TIME,
		customer_id			INT,
		gender				NVARCHAR(15),
		age					INT,
		category			NVARCHAR(15),
		quantiy				INT,
		price_per_unit		FLOAT,
		cogs				FLOAT,
		total_sale			FLOAT

);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
-- DATA EXPLORATION

-- Total sales made
SELECT 
	*
FROM
	`sql_project_p1`.`retail_sales`;
    
-- Total customers
SELECT 
	COUNT(customer_id) total_customers
FROM
	`sql_project_p1`.`retail_sales`;
    
-- Total unique customers
SELECT 
 COUNT(distinct customer_id) unique_customers
FROM
	`sql_project_p1`.`retail_sales`;


-- Total sales amount
SELECT 
	sum(total_sale) 
FROM
	`sql_project_p1`.`retail_sales`;

-- Total amount quantity sold

SELECT
	sum(quantiy) total_quantity
FROM
	`sql_project_p1`.`retail_sales`;
    
-- all categories

SELECT 
	distinct category
FROM
	`sql_project_p1`.`retail_sales`;
    
-- Lowest and Highest price_per_unit
SELECT
	min(price_per_unit) lowest_price,
	max(price_per_unit) highest_price
FROM
	`sql_project_p1`.`retail_sales`;
    
-- Lowest and highest cogs
SELECT
	min(cogs) lowest_cog,
	max(cogs) highest_cog
FROM
	`sql_project_p1`.`retail_sales`;
    
-- Lowest and highest sale amount
SELECT
	min(total_sale) lowest_sale_amount,
	max(total_sale) highest_sale_amount
FROM
	`sql_project_p1`.`retail_sales`;
    
-- Lowest and highest quantity amount sold
SELECT
	min(quantity) lowest_quantity_sold,
	max(quantity) highest_quantity_sold
FROM
	`sql_project_p1`.`retail_sales`;
    
-- Years of Operation
SELECT 
	distinct year(sale_date)
FROM 
	`sql_project_p1`.`retail_sales`;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
SELECT 
	*
FROM 
	`sql_project_p1`.`retail_sales`
WHERE
	sale_date = '2022-11-05';
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
SELECT 
  *
FROM 
	`sql_project_p1`.`retail_sales`
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4;
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
SELECT 
	distinct category,
	sum(total_sale) total_sale
FROM
	`sql_project_p1`.`retail_sales`
GROUP BY
	category;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
SELECT 
	round(avg(age)) avg_age
FROM
	`sql_project_p1`.`retail_sales`
WHERE
	category = 'Beauty';
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
SELECT
	*
FROM
	`sql_project_p1`.`retail_sales`
WHERE
	total_sale > 1000
ORDER BY
	total_sale DESC;
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
SELECT
	distinct category,
    gender,
    count(transactions_id) transactions
FROM
	`sql_project_p1`.`retail_sales`
GROUP BY 
	category,
    gender
ORDER BY
	count(transactions_id) DESC;
```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
SELECT
	*
FROM
	`sql_project_p1`.`retail_sales`
ORDER BY
	total_sale DESC
LIMIT 
	5;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
SELECT
	category,
    count(distinct customer_id) total_customers
FROM
	`sql_project_p1`.`retail_sales`
GROUP BY
	category
ORDER BY
	count(distinct customer_id) DESC;
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
SELECT
    CASE
        WHEN sale_time < '12:00:00' THEN 'morning'
        WHEN sale_time > '12:00:00' & sale_time < '17:00:00' THEN 'afternoon'
         ELSE 'evening'
    END shift,
     COUNT(transactions_id) orders
FROM
    `sql_project_p1`.`retail_sales`
GROUP BY
    shift
ORDER BY
    orders;
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Run the SQL scripts provided in the `ddl_retail.sql` file to create and populate the database.
3. **Run the Queries**: Use the SQL queries provided in the `business_questions_solved.sql` file to perform your analysis.
4. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

## Author - Chris junior musas

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

### Stay Updated

- **LinkedIn**: [Connect with me professionally](www.linkedin.com/in/cj-diba-musas)

Thank you for your support, and I look forward to connecting with you!
