-- ================================================================
-- Data Ingestion Script for Bronze Layer
-- Using BULK INSERT to load CSV data into Bronze tables
-- ================================================================

-- NOTE:
-- If you previously got this error:
-- Msg 4861, Level 16, State 1, Line X
-- Cannot bulk load because the file "..." could not be opened. 
-- Operating system error code 5(Access is denied.).
-- This happens because SQL Server does not have permission to read the file.
-- Solution: Grant read permissions on the CSV file/folder to the SQL Server service account.
-- You can check which account SQL Server is running under in "services.msc".
-- or
-- Always check the SQL Server service account by running:
-- SELECT servicename, service_account 
-- FROM sys.dm_server_services;

-- This tells you which user needs permission to that folder.

-- ================================================================
-- CRM: Customer Info
-- ================================================================
USE DataWareHouse;

-- Empty the table before loading fresh data
TRUNCATE TABLE bronze.crm_cust_info;

-- Load data from CSV
BULK INSERT bronze.crm_cust_info
FROM 'D:\SQL\datasets\source_crm\cust_info.csv'
WITH (
    FIRSTROW = 2,             -- Skip header row
    FIELDTERMINATOR = ',',     -- Column separator
    TABLOCK                   -- Optimize locking for bulk insert
);

-- Validate data
SELECT * FROM bronze.crm_cust_info;
SELECT COUNT(*) FROM bronze.crm_cust_info;

-- ================================================================
-- CRM: Product Info
-- ================================================================
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'D:\SQL\datasets\source_crm\prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT * FROM bronze.crm_prd_info;
SELECT COUNT(*) FROM bronze.crm_prd_info;

-- ================================================================
-- CRM: Sales Details
-- ================================================================
TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'D:\SQL\datasets\source_crm\sales_details.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT * FROM bronze.crm_sales_details;
SELECT COUNT(*) FROM bronze.crm_sales_details;

-- ================================================================
-- ERP: Customer Data
-- ================================================================
TRUNCATE TABLE bronze.erp_cust_az12;

BULK INSERT bronze.erp_cust_az12
FROM 'D:\SQL\datasets\source_erp\CUST_AZ12.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT * FROM bronze.erp_cust_az12;
SELECT COUNT(*) FROM bronze.erp_cust_az12;

-- ================================================================
-- ERP: Location Data
-- ================================================================
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'D:\SQL\datasets\source_erp\LOC_A101.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT * FROM bronze.erp_loc_a101;
SELECT COUNT(*) FROM bronze.erp_loc_a101;

-- ================================================================
-- ERP: Product Categories
-- ================================================================
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'D:\SQL\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT * FROM bronze.erp_px_cat_g1v2;
SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;

-- ================================================================
-- IMPORTANT NOTE:
-- Before executing BULK INSERT:
-- 1. Ensure the SQL Server service account has Read permissions on the folder and CSV files.
-- 2. Check that the file path is correct and accessible from the SQL Server machine.
-- 3. Using TABLOCK improves performance during bulk inserts.
-- 4. Change the path to your specific location
-- ================================================================
