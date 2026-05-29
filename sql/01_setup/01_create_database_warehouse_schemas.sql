-- ============================================================
-- 01_create_database_warehouse_schemas.sql
-- Project: NorthBridge IMS Data Engineering Pipeline
-- Purpose: Create Snowflake database, warehouse, and schemas
-- ============================================================

CREATE DATABASE IF NOT EXISTS NORTHBRIDGE_IMS;

USE DATABASE NORTHBRIDGE_IMS;

CREATE WAREHOUSE IF NOT EXISTS NORTHBRIDGE_WH
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE;

USE WAREHOUSE NORTHBRIDGE_WH;

CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS STAGING;
CREATE SCHEMA IF NOT EXISTS REPORTING;

SHOW SCHEMAS IN DATABASE NORTHBRIDGE_IMS;
