import pandas as pd

tickets = pd.read_csv("data/raw/tickets.csv")
clients = pd.read_csv("data/raw/clients.csv")
agents = pd.read_csv("data/raw/agents.csv")

print("Tickets:")
print(tickets.head())

print("\nClients:")
print(clients.head())

print("\nAgents:")
print(agents.head())