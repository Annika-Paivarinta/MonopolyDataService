# MonopolyDataService
This is the data service application for the CS 262 Monopoly project, which is deployed here:
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/

It has the following read data route URLs:

/            a hello message
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/            

/players     a list of players
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/players     

/players/:id a single player with the given ID
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/players/1   

/score/:name      lists the scores that that player has gotten in all their games
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/score/Dogbreath

(not found)
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/-1      

(undefined endpoint)
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/blob                     

