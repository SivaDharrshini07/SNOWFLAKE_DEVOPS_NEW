/*-----------------------------------------------------------------------------

Script:       00_setup_snowflake.sql
-----------------------------------------------------------------------------*/

USE ROLE ACCOUNTADMIN;


-- ----------------------------------------------------------------------------
-- Step #1: Create the account level objects
-- ----------------------------------------------------------------------------

--SET MY_USER = CURRENT_USER();
SET MY_USER = 'SIVADHARRSHINISP';

-- Roles
CREATE ROLE SF_GIT_DEMO_ROLE;
GRANT ROLE SF_GIT_DEMO_ROLE TO ROLE SYSADMIN;
GRANT ROLE SF_GIT_DEMO_ROLE TO USER IDENTIFIER($MY_USER);

-- Databases
CREATE DATABASE SF_GIT_DEMO_DB;
GRANT OWNERSHIP ON DATABASE SF_GIT_DEMO_DB TO ROLE SF_GIT_DEMO_ROLE;

-- Warehouses
CREATE WAREHOUSE SF_GIT_DEMO_WH WAREHOUSE_SIZE = XSMALL, AUTO_SUSPEND = 300, AUTO_RESUME= TRUE;
GRANT OWNERSHIP ON WAREHOUSE SF_GIT_DEMO_WH TO ROLE SF_GIT_DEMO_ROLE;


-- ----------------------------------------------------------------------------
-- Step #2: Create the database level objects
-- ----------------------------------------------------------------------------
USE ROLE SF_GIT_DEMO_ROLE;
USE WAREHOUSE SF_GIT_DEMO_WH;
USE DATABASE SF_GIT_DEMO_DB;

-- Schemas
CREATE SCHEMA SF_GIT_DEMO_SCHEMA;
