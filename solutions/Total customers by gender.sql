-- This script gives us an idea as to how many represent each gender

SELECT 
	gender,
    count(*) total_gender
FROM 
	`sql_project_p1`.`retail_sales`
WHERE 
	gender = 'male';
    
SELECT 
	gender,
    count(*) total_gender
FROM 
	`sql_project_p1`.`retail_sales`
WHERE 
	gender = 'female';

