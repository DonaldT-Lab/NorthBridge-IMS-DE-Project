# NorthBridge IMS – Data Analyst Handover

## Data Source

Snowflake Database:
NORTHBRIDGE_IMS

Reporting Schema:
REPORTING

Primary Analytics Objects:

* FACT_TICKETS
* DIM_AGENTS
* DIM_CLIENTS
* DIM_PRIORITY
* DIM_CATEGORY

Recommended Power BI Connection:

VW_TICKET_ANALYTICS

## Available KPIs

* Total Tickets
* SLA Breach Count
* SLA Breach %
* Tickets by Priority
* Tickets by Region
* Tickets by Agent
* Tickets by Channel
* Tickets by Category

## Data Engineering Pipeline

Excel Workbook
→ Python CSV Extraction
→ Amazon S3 Data Lake
→ Snowflake RAW
→ Snowflake STAGING
→ Snowflake REPORTING

Prepared by:
Donald Turyamureba
Data Engineering Lead
