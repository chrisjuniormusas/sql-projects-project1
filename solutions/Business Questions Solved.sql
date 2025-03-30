-- Q.1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:

SELECT 
	*
FROM 
	`sql_project_p1`.`retail_sales`
WHERE
	sale_date = '2022-11-05';
    
-- 	Q.2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT 
  *
FROM `sql_project_p1`.`retail_sales`
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4;
    
-- Q.3. Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT 
	distinct category,
	sum(total_sale) total_sale
FROM
	`sql_project_p1`.`retail_sales`
GROUP BY
	category;
    
-- Q.4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT 
	round(avg(age)) avg_age
FROM
	`sql_project_p1`.`retail_sales`
WHERE
	category = 'Beauty';
    
-- Q.5. Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT
	*
FROM
	`sql_project_p1`.`retail_sales`
WHERE
	total_sale > 1000
ORDER BY
	total_sale DESC;

-- Q.6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:

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
    
-- Q.7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT
	distinct extract(year from sale_date) years,
	extract(month from sale_date) months,
    round(avg(total_sale)) avg_sale,
    rank() OVER (partition by year(sale_date) ORDER BY avg(total_sale))
FROM
	`sql_project_p1`.`retail_sales`
GROUP BY
	extract(year from sale_date),
    extract(month from sale_date);
    
-- Q.8. **Write a SQL query to find the top 5 customers based on the highest total sales **

SELECT
	*
FROM
	`sql_project_p1`.`retail_sales`
ORDER BY
	total_sale DESC
LIMIT 
	5;
    
-- Q.9. Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT
	category,
    count(distinct customer_id) total_customers
FROM
	`sql_project_p1`.`retail_sales`
GROUP BY
	category
ORDER BY
	count(distinct customer_id) DESC;
    
-- Q.10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
		
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
            
    



    
    


    


    