# MonopolyDataService
This is the data service application for the CS 262 Monopoly project, which is deployed here:

[https://cs262-webservice.azurewebsites.net/](https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/)
monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net
It has the following read data route URLs:

/ a hello message
/players a list of players
/players/:id a single player with the given ID
It is based on the standard Azure App Service tutorial for Node.js.

https://learn.microsoft.com/en-us/azure/app-service/quickstart-nodejs?tabs=linux&pivots=development-environment-cli
The database is relational with the schema specified in the sql/ sub-directory and is hosted on Azure PostgreSQL. The database server, user and password are stored as Azure application settings so that they aren’t exposed in this (public) repo.

We implement this sample service as a separate repo to simplify Azure integration; it’s easier to auto-deploy a separate repo to Azure. For your team project’s data service, configure your Azure App Service to auto-deploy from the master/main branch of your service repo. See the settings for this in the “Deployment Center” on your Azure service dashboard.
