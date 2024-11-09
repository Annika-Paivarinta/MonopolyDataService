--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
-- ap43@calvin.edu

-- Drop previous versions of the tables if they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS PlayerProperties;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS GameBoard;
DROP TABLE IF EXISTS Space;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Game;

-- Create the schema, starting with tables that don't have foreign key dependencies.
CREATE TABLE Game (
    ID integer PRIMARY KEY,
    time timestamp
);

CREATE TABLE Player (
    ID integer PRIMARY KEY,
    emailAddress varchar(50) NOT NULL,
    name varchar(50),
    cash integer DEFAULT 1500,
    spaceID integer DEFAULT 0,
    score integer DEFAULT 0
);

CREATE TABLE Space (
    ID integer PRIMARY KEY,
    name varchar(50) NOT NULL,
    type varchar(50) NOT NULL,
    gameID integer REFERENCES Game(ID) DEFAULT 0,
    cost integer DEFAULT 0,
    rent integer DEFAULT 0,
    isOwned boolean DEFAULT false,
    ownerID integer REFERENCES Player(ID) DEFAULT 0,
    numHouses integer DEFAULT 0,
    numHotels integer DEFAULT 0
);

CREATE TABLE GameBoard (
    ID integer PRIMARY KEY,
    spaceIDs integer[] NOT NULL,
    playerIDs integer[] NOT NULL
);

CREATE TABLE Property (
    ID integer PRIMARY KEY,
    name varchar(50) NOT NULL,
    cost integer DEFAULT 0,
    rent integer DEFAULT 0,
    houseCost integer DEFAULT 0,
    hotelCost integer DEFAULT 0,
    numHouses integer DEFAULT 0,
    numHotels integer DEFAULT 0,
    mortgageValue integer DEFAULT 0,
    isMortgaged boolean DEFAULT false,
    ownerID integer REFERENCES Player(ID) DEFAULT 0
);

CREATE TABLE PlayerProperties (
    playerID integer REFERENCES Player(ID),
    gameID integer REFERENCES Game(ID),
    propertyIDs integer[] DEFAULT '{}',
    PRIMARY KEY (playerID, gameID)
);

CREATE TABLE PlayerGame (
    gameID integer REFERENCES Game(ID),
    playerID integer REFERENCES Player(ID),
    score INT DEFAULT 0,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (gameID, playerID)
);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON GameBoard TO PUBLIC;
GRANT SELECT ON Space TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PlayerProperties TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2024-10-31 23:59:59');
INSERT INTO Game VALUES (5, '2024-11-01 00:00:00');

INSERT INTO Player(ID, emailAddress, name, cash, spaceID, score) VALUES (1, 'me@calvin.edu', 'Player1', 2000, 30, 1000);
INSERT INTO Player VALUES (0, 'placeholder@game.com', 'Unowned', 20, 10, 0);
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King', 1000, 25, 2000);
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath', 500, 20, 1500);
INSERT INTO Player VALUES (4, 'null@gmail.edu', NULL, 600, 20, 2500);
INSERT INTO Player VALUES (5, 'doesntexist@hotmail.com', NULL, 700, 20, 3000);

INSERT INTO PlayerGame VALUES (1, 1, 0);
INSERT INTO PlayerGame VALUES (1, 2, 0);
INSERT INTO PlayerGame VALUES (2, 3, 10);
INSERT INTO PlayerGame VALUES (2, 2, 20);
INSERT INTO PlayerGame VALUES (3, 1, 30);
INSERT INTO PlayerGame VALUES (3, 2, 40);
INSERT INTO PlayerGame VALUES (4, 1, 50);
INSERT INTO PlayerGame VALUES (4, 2, 60);

INSERT INTO GameBoard VALUES (1, '{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39}', '{1,2,3}');

INSERT INTO Space VALUES (1, 'Chance', 'Chance', 1, 0, 0, false, 0, 0, 0);
INSERT INTO Space VALUES (2, 'Vermont Avenue', 'Property', 1, 100, 6, true, 1, 4, 0);

INSERT INTO PlayerProperties VALUES (1, 1, '{6,9,15}');
INSERT INTO PlayerProperties VALUES (2, 1, '{4,11,13}');

INSERT INTO Property VALUES (4, 'Baltic Avenue', 60, 4, 50, 50, 2, 2, 30, true, 2);
INSERT INTO Property VALUES (6, 'Oriental Avenue', 100, 6, 50, 50, 0, 0, 50, false, 0);

INSERT INTO Space VALUES (10, 'Connecticut Avenue', 'Property', 1, 120, 8, false, 0, 0, 0);