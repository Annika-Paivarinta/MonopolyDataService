# MonopolyDataService
This is the data service application for the CS 262 Monopoly project, which is deployed here:
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/

It has the following read data route URLs:

/ a hello message
/players a list of players
/players/:id a single player with the given ID
It is based on the standard Azure App Service tutorial for Node.js.

https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=linux&pivots=development-environment-cli
The database is relational with the schema specified in the sql/ sub-directory and is hosted on Azure PostgreSQL. The database server, user and password are stored as Azure application settings so that they aren’t exposed in this (public) repo.

https://cs262-webservice.azurewebsites.net/
https://cs262-webservice.azurewebsites.net/players
https://cs262-webservice.azurewebsites.net/players/1
https://cs262-webservice.azurewebsites.net/players/-1 (not found)
https://cs262-webservice.azurewebsites.net/blob (undefined endpoint)
