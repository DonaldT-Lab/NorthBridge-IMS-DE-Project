# NorthBridge IMS – Data Engineering Project Summary

## Project Overview

The NorthBridge IMS project was developed to support customer service ticket management and SLA performance reporting for NorthBridge Health Services.

The objective was to design and implement a modern cloud-based data pipeline capable of ingesting operational data, storing it in a data warehouse, and preparing it for analytical reporting by Data Analysts and Business Intelligence teams.

---

## Architecture

Source Data (Excel Workbook)
↓
Python Data Extraction
↓
CSV Files
↓
Amazon S3 Data Lake
↓
Snowflake RAW Layer
↓
Snowflake STAGING Layer
↓
Snowflake REPORTING Layer
↓
Power BI / Data Analytics

---

## Technologies Used

* Python
* Pandas
* AWS S3
* Snowflake
* SQL
* Git
* GitHub

---

## Data Pipeline

### Source Data

The source data was supplied as a multi-sheet Excel workbook containing:

* Agents
* Clients
* Tickets
* Ticket Categories
* Priority Levels
* SLA Definitions
* Escalation Log
* Ticket Audit Log

### Extraction

Python scripts were developed to:

* Extract worksheets
* Split datasets into CSV files
* Perform data inspection and validation

### Data Lake

CSV files were stored in Amazon S3 using a raw data lake structure.

### Data Warehouse

Data was loaded into Snowflake using:

* External Stage
* File Format
* COPY INTO commands

---

## Warehouse Design

### RAW Layer

Raw data stored exactly as received.

Tables:

* AGENTS
* CLIENTS
* PRIORITYLEVELS
* TICKETCATEGORIES
* SLADEFINITIONS
* TICKETS
* ESCALATIONLOG
* TICKETAUDITLOG

### STAGING Layer

Data cleansing and standardisation.

Tables:

* STG_TICKETS

### REPORTING Layer

Analytical star schema.

Dimensions:

* DIM_AGENTS
* DIM_CLIENTS
* DIM_PRIORITY
* DIM_CATEGORY

Facts:

* FACT_TICKETS

Views:

* VW_TICKET_ANALYTICS

---

## Dataset Statistics

| Dataset           | Records |
| ----------------- | ------: |
| Agents            |     120 |
| Clients           |      80 |
| Priority Levels   |       4 |
| Ticket Categories |       5 |
| SLA Definitions   |      12 |
| Tickets           |   3,500 |
| Escalation Log    |     464 |
| Ticket Audit Log  |  17,751 |

---

## Key Business Findings

### SLA Performance

Total Tickets: 3,500

Breached Tickets: 754

SLA Breach Rate: 21.54%

### Ticket Priority Distribution

* P3 Standard: 1,981
* P2 High: 833
* P4 Low: 428
* P1 Critical: 258

### Ticket Distribution by Region

* Midlands: 893
* Yorkshire: 559
* South East: 543
* North West: 532
* North East: 515
* Scotland: 458

---

## Outcome

A complete cloud-based data engineering pipeline was successfully implemented using AWS S3 and Snowflake, providing a structured and analytics-ready dataset for downstream reporting and dashboard development.
