/******************************************************************************************
WARNING:
This script will DELETE the existing 'DataWarehouse' database if it already exists.
All data inside the database will be permanently removed.
******************************************************************************************/

/******************************************************************************************
Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up 
three schemas within the database: 'bronze', 'silver', and 'gold'.
******************************************************************************************/

-- Use master database to manage database-level operations
USE master;
GO

-- Check if the database already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    -- Set database to SINGLE_USER mode to force disconnect active connections
    ALTER DATABASE DataWarehouse 
    SET SINGLE_USER 
    WITH ROLLBACK IMMEDIATE;

    -- Drop the existing database
    DROP DATABASE DataWarehouse;
END
GO

-- Create a new DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database
USE DataWarehouse;
GO

-- Create Bronze schema
CREATE SCHEMA bronze;
GO

-- Create Silver schema
CREATE SCHEMA silver;
GO

-- Create Gold schema
CREATE SCHEMA gold;
GO
