# NorthBridge IMS – Data Analyst Handover

## Overview

The data engineering pipeline has been completed and all required datasets have been prepared for analytical consumption.

The reporting layer has been designed to minimise the amount of data modelling required by analysts.

---

## Snowflake Location

Database:

NORTHBRIDGE_IMS

Schema:

REPORTING

---

## Recommended Data Source

Primary reporting object:

VW_TICKET_ANALYTICS

This view contains:

* Ticket information
* Client information
* Agent information
* Priority information
* Category information
* SLA status

Analysts should use this object as the primary source for Power BI dashboards.

---

## Available KPIs

The following KPIs are available for reporting:

### Service Desk Metrics

* Total Tickets
* Open Tickets
* Closed Tickets
* Tickets by Priority
* Tickets by Category
* Tickets by Channel

### SLA Metrics

* SLA Breach Count
* SLA Breach Percentage
* Tickets Breaching SLA
* SLA Performance Trends

### Regional Metrics

* Tickets by Region
* Regional SLA Performance

### Agent Metrics

* Tickets Assigned
* Tickets Resolved
* Workload Distribution
* Performance Analysis

---

## Recommended Power BI Dashboards

### Executive Dashboard

* Total Tickets
* SLA Breach %
* Tickets by Region
* Tickets by Priority

### Operations Dashboard

* Ticket Volume Trends
* Agent Performance
* Category Analysis
* Channel Analysis

### SLA Dashboard

* Breach Rate
* Priority vs SLA Performance
* Regional SLA Performance

---

## Contact

Data Engineering Lead

Donald Turyamureba

NorthBridge IMS Project
