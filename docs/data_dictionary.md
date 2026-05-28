# NorthBridge IMS Data Dictionary

## Tickets

| Column          | Description               |
| --------------- | ------------------------- |
| TicketID        | Unique ticket identifier  |
| TicketReference | Business ticket reference |
| ClientID        | Client raising the ticket |
| PatientRef      | Patient reference         |
| CategoryID      | Ticket category           |
| PriorityID      | Ticket priority           |
| Status          | Current ticket status     |
| AssignedAgentID | Assigned support agent    |
| CreatedAt       | Ticket creation timestamp |
| FirstResponseAt | First response timestamp  |
| ResolvedAt      | Resolution timestamp      |
| SLADueAt        | SLA deadline              |
| SLABreached     | SLA breach indicator      |
| Channel         | Submission channel        |
| Description     | Ticket description        |
| ResolutionNotes | Resolution details        |

## Clients

| Column           | Description                 |
| ---------------- | --------------------------- |
| ClientID         | Unique client identifier    |
| ClientName       | Client name                 |
| ContractTier     | Service tier                |
| Region           | Client region               |
| AccountManagerID | Responsible account manager |

## Agents

| Column        | Description             |
| ------------- | ----------------------- |
| AgentID       | Unique agent identifier |
| FullName      | Agent full name         |
| TeamID        | Team assignment         |
| Role          | Job role                |
| Hub           | Operational hub         |
| DailyCapacity | Daily ticket capacity   |
| IsActive      | Active status           |
