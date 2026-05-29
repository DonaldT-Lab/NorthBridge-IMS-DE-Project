-- ============================================================
-- 02_create_raw_tables_and_load.sql
-- Project: NorthBridge IMS Data Engineering Pipeline
-- Purpose: Create RAW tables and load CSV files from Amazon S3
-- WARNING: Do not commit real AWS credentials to GitHub.
-- ============================================================

USE DATABASE NORTHBRIDGE_IMS;
USE WAREHOUSE NORTHBRIDGE_WH;
USE SCHEMA RAW;

-- File format for CSV files
CREATE OR REPLACE FILE FORMAT CSV_FORMAT
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
NULL_IF = ('NULL', 'null', '')
EMPTY_FIELD_AS_NULL = TRUE;

-- External stage pointing to S3 raw folder
CREATE OR REPLACE STAGE S3_RAW_STAGE
URL = 's3://northbridge-ims-data-lake-donald/raw/'
CREDENTIALS = (
AWS_KEY_ID = '<YOUR_AWS_ACCESS_KEY>'
AWS_SECRET_KEY = '<YOUR_AWS_SECRET_KEY>'
)
FILE_FORMAT = CSV_FORMAT;

LIST @S3_RAW_STAGE;

-- Agents
CREATE OR REPLACE TABLE AGENTS (
AgentID INTEGER,
FullName STRING,
TeamID INTEGER,
Role STRING,
Specialisms STRING,
Hub STRING,
DailyCapacity INTEGER,
IsActive BOOLEAN
);

COPY INTO AGENTS
FROM @S3_RAW_STAGE/agents.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

-- Clients
CREATE OR REPLACE TABLE CLIENTS (
ClientID INTEGER,
ClientName STRING,
ClientType STRING,
ContractTier STRING,
AccountManagerID INTEGER,
Region STRING,
ContractStartDate DATE,
ContractEndDate DATE,
SLACreditClause BOOLEAN,
IsActive BOOLEAN
);

COPY INTO CLIENTS
FROM @S3_RAW_STAGE/clients.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

-- Priority Levels
CREATE OR REPLACE TABLE PRIORITYLEVELS (
PriorityID INTEGER,
PriorityLabel STRING,
Description STRING
);

COPY INTO PRIORITYLEVELS
FROM @S3_RAW_STAGE/prioritylevels.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

-- Ticket Categories
CREATE OR REPLACE TABLE TICKETCATEGORIES (
CategoryID INTEGER,
CategoryName STRING,
DefaultPriorityID INTEGER,
RequiresSpecialist BOOLEAN,
Description STRING
);

COPY INTO TICKETCATEGORIES
FROM @S3_RAW_STAGE/ticketcategories.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

-- SLA Definitions
CREATE OR REPLACE TABLE SLADEFINITIONS (
SLAID INTEGER,
ContractTier STRING,
PriorityID INTEGER,
FirstResponseHours INTEGER,
ResolutionHours INTEGER,
EscalationTriggerHours INTEGER,
EffectiveFrom DATE
);

COPY INTO SLADEFINITIONS
FROM @S3_RAW_STAGE/sladefinitions.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

-- Tickets
CREATE OR REPLACE TABLE TICKETS (
TicketID INTEGER,
TicketReference STRING,
ClientID INTEGER,
PatientRef STRING,
CategoryID INTEGER,
PriorityID INTEGER,
Status STRING,
AssignedAgentID INTEGER,
CreatedAt TIMESTAMP_NTZ,
FirstResponseAt TIMESTAMP_NTZ,
ResolvedAt TIMESTAMP_NTZ,
SLADueAt TIMESTAMP_NTZ,
SLABreached BOOLEAN,
Channel STRING,
Description STRING,
ResolutionNotes STRING
);

COPY INTO TICKETS
FROM @S3_RAW_STAGE/tickets.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

-- Escalation Log
CREATE OR REPLACE TABLE ESCALATIONLOG (
EscalationID INTEGER,
TicketID INTEGER,
EscalatedFrom STRING,
EscalatedTo STRING,
EscalationReason STRING,
EscalatedAt TIMESTAMP_NTZ,
AutomatedFlag BOOLEAN
);

COPY INTO ESCALATIONLOG
FROM @S3_RAW_STAGE/escalationlog.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

-- Ticket Audit Log
CREATE OR REPLACE TABLE TICKETAUDITLOG (
LogID INTEGER,
TicketID INTEGER,
ActionType STRING,
ActionByID INTEGER,
ActionAt TIMESTAMP_NTZ,
PreviousValue STRING,
NewValue STRING,
Notes STRING
);

COPY INTO TICKETAUDITLOG
FROM @S3_RAW_STAGE/ticketauditlog.csv
FILE_FORMAT = CSV_FORMAT
ON_ERROR = 'CONTINUE';

SHOW TABLES IN SCHEMA RAW;
