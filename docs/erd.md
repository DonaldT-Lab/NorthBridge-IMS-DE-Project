CLIENTS
|
| ClientID
|
TICKETS
|
+---- AssignedAgentID ---- AGENTS
|
+---- PriorityID --------- PRIORITYLEVELS
|
+---- CategoryID --------- TICKETCATEGORIES
|
+---- TicketID ----------- ESCALATIONLOG
|
+---- TicketID ----------- TICKETAUDITLOG

CLIENTS.AccountManagerID
|
|
AGENTS.AgentID

SLADEFINITIONS
|
+---- PriorityID
+---- ContractTier
