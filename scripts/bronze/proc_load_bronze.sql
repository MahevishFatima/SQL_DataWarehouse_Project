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

/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 

	BEGIN TRY

		SET @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting data into bronze.crm_cust_info...';
        BULK INSERT bronze.crm_cust_info
        FROM 'D:\SQL\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,             
            FIELDTERMINATOR = ',',     
            TABLOCK                   
        );

        SELECT COUNT(*) AS crm_cust_info_rows FROM bronze.crm_cust_info;

        SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';
        
        -- ================================================================
        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting data into bronze.crm_prd_info...';
        BULK INSERT bronze.crm_prd_info
        FROM 'D:\SQL\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SELECT COUNT(*) AS crm_prd_info_rows FROM bronze.crm_prd_info;

        SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        -- ================================================================
        SET @start_time = GETDATE();

        PRINT '>> Truncating bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting data into bronze.crm_sales_details...';
        BULK INSERT bronze.crm_sales_details
        FROM 'D:\SQL\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SELECT COUNT(*) AS crm_sales_details_rows FROM bronze.crm_sales_details;

        SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        -- ================================================================
        PRINT '======';
        PRINT 'LOADING ERP TABLE';
        PRINT '======';

        SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting data into bronze.erp_cust_az12...';
        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\SQL\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SELECT COUNT(*) AS erp_cust_rows FROM bronze.erp_cust_az12;

        SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        -- ================================================================
        SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting data into bronze.erp_loc_a101...';
        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\SQL\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SELECT COUNT(*) AS erp_loc_rows FROM bronze.erp_loc_a101;

        SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

        -- ================================================================
        SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting data into bronze.erp_px_cat_g1v2...';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\SQL\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SELECT COUNT(*) AS erp_px_cat_rows FROM bronze.erp_px_cat_g1v2;

        SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

		SET @batch_end_time = GETDATE();

        -- ================================================================
        PRINT '========';
        PRINT 'BRONZE LAYER LOADING COMPLETED';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '========';

    END TRY

    BEGIN CATCH
        PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
    END CATCH

END


-- ================================================================
-- IMPORTANT NOTE:
-- Before executing BULK INSERT:
-- 1. Ensure the SQL Server service account has Read permissions on the folder and CSV files.
-- 2. Check that the file path is correct and accessible from the SQL Server machine.
-- 3. Using TABLOCK improves performance during bulk inserts.
-- 4. Change the path to your specific location
-- ================================================================

-- EXEC bronze.load_bronze

