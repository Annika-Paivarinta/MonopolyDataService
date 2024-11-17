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

/scores/:name      lists the scores that that player has gotten in all their games
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/scores/1

(not found)
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/-1      

(undefined endpoint)
https://monopolyweb-fya4bjavedfab5gw.centralus-01.azurewebsites.net/blob                     



Homework03:
What are the (active) URLs for your data service?
- the hello message, the list of players, the single player with ID, the list of scores, and the error pages

Which of these endpoints implement actions that are idempotent? nullipotent?
- all of these are idempotent because they all result in the same output without changing the data itself

Is the service RESTful? If not, why not? If so, what key features make it RESTful.
- Yes, it is. It returns data in JSON format, it uses HTTP commands, it is stateless, and it uses directory structured URLS

Is there any evidence in your implementation of an impedance mismatch?
- not that I know of
