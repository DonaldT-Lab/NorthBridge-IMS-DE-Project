-- ============================================================
-- 05_validation_queries.sql
-- Project: NorthBridge IMS Data Engineering Pipeline
-- Purpose: Validate reporting layer and business KPIs
-- ============================================================

USE DATABASE NORTHBRIDGE_IMS;
USE WAREHOUSE NORTHBRIDGE_WH;
USE SCHEMA REPORTING;

-- Row count checks
SELECT COUNT(*) AS AgentCount FROM DIM_AGENTS;
SELECT COUNT(*) AS ClientCount FROM DIM_CLIENTS;
SELECT COUNT(*) AS PriorityCount FROM DIM_PRIORITY;
SELECT COUNT(*) AS CategoryCount FROM DIM_CATEGORY;
SELECT COUNT(*) AS TicketCount FROM FACT_TICKETS;

-- SLA breach KPI
SELECT
    COUNT(*) AS TotalTickets,
    SUM(CASE WHEN SLABreached = TRUE THEN 1 ELSE 0 END) AS BreachedTickets,
    ROUND(
        100.0 * SUM(CASE WHEN SLABreached = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS BreachPercent
FROM FACT_TICKETS;

-- Tickets by priority
SELECT
    p.PriorityLabel,
    COUNT(*) AS TicketCount
FROM FACT_TICKETS t
JOIN DIM_PRIORITY p
    ON t.PriorityID = p.PriorityID
GROUP BY p.PriorityLabel
ORDER BY TicketCount DESC;

-- Tickets by region
SELECT
    c.Region,
    COUNT(*) AS TicketCount
FROM FACT_TICKETS t
JOIN DIM_CLIENTS c
    ON t.ClientID = c.ClientID
GROUP BY c.Region
ORDER BY TicketCount DESC;

-- Analyst handover view check
SELECT *
FROM VW_TICKET_ANALYTICS
LIMIT 20;