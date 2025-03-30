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
  



    
