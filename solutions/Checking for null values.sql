-- Data Cleaning
-- Checking for null values
SELECT
	*
FROM 
	`sql_project_p1`.`retail_sales`
WHERE 
	transactions_id = null
    or
    sale_date = null
    or
    sale_time = null
    or
    customer_id = null
    or
    gender = null
    or
    age = null
    or
    category = null
    or
    quantiy = null
    or
    price_per_unit = null
    or
    cogs = null
    or
    total_sale = null;
    
-- Deleting null values

DELETE FROM `sql_project_p1`.`retail_sales`
WHERE 
	transactions_id = null
    or
    sale_date = null
    or
    sale_time = null
    or
    customer_id = null
    or
    gender = null
    or
    age = null
    or
    category = null
    or
    quantiy = null
    or
    price_per_unit = null
    or
    cogs = null
    or
    total_sale = null;
	