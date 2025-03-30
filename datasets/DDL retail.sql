--sql_project_p1 Retail Analysis --
/*
===============================================================================
DDL Script: Create retail_sales Table
===============================================================================
Script Purpose:
    This script creates tables in the sql_project_p1 database, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'retail_sales' Table
===============================================================================
*/
-- Create Tables

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
