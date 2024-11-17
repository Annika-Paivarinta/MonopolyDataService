-- SELECT * FROM Game ORDER BY time DESC;  -- Retrieve a list of all the games, ordered by date with the most recent game coming first.

-- SELECT * FROM Game WHERE time >= NOW() - INTERVAL '7 days'; -- Retrieve all the games that occurred in the past week.

-- SELECT * FROM Player WHERE name IS NOT NULL; -- Retrieve a list of players who have (non-NULL) names.

-- SELECT ID FROM Player WHERE score >= 2000; -- Retrieve a list of IDs for players who have some game score larger than 2000.

-- SELECT * FROM Player WHERE emailAddress LIKE '%gmail%'; -- Retrieve a list of players who have GMail accounts.

-- SELECT PlayerGame.score FROM Player, PlayerGame WHERE Player.ID = PlayerGame.playerID AND Player.name = 'The King'; -- Retrieve all “The King”’s game scores in decreasing order.

-- SELECT Player.name FROM Player, PlayerGame, Game WHERE Player.ID = PlayerGame.playerID AND Game.time = '2006-06-28 13:20:00' AND Game.ID = PlayerGame.gameID AND PlayerGame.score = (SELECT MAX(score) FROM PlayerGame WHERE gameID = Game.ID); -- Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.

-- So what does that P1.ID < P2.ID clause do in the last example query (i.e., the from SQL Examples)?
    -- The clause asigns a different player to P1 and P2 so that it can compare ID's or aspects of the two different players and display them

-- The query that joined the Player table to itself seems rather contrived. Can you think of a realistic situation in which you’d want to join a table to itself?
    -- When you want to compare two different aspects of the same table, such as comparing the scores of two different players in the same game

    

-- 11/16/2024: join table
-- SELECT score FROM Player, PlayerGame WHERE Player.ID = PlayerGame.playerID AND Player.name = "Player1";