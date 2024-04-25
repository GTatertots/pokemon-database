CREATE TABLE pokemon (
	pokedex_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL UNIQUE,
	type1 TEXT NOT NULL,
	type2 TEXT,
	bst INTEGER NOT NULL,
	hp INTEGER NOT NULL,
	atk INTEGER NOT NULL,
	spatk INTEGER NOT NULL,
	def INTEGER NOT NULL,
	spdef INTEGER NOT NULL,
	spd INTEGER NOT NULL
);

CREATE TABLE moves (
	name TEXT PRIMARY KEY,
	physical BOOLEAN NOT NULL,
	moveType TEXT NOT NULL,
	pow INTEGER NOT NULL,
	hit_chance INTEGER,
	secondary TEXT,
	priority INTEGER
);

CREATE TABLE canlearn (
	pokemon_id INTEGER,
	move TEXT,
	PRIMARY KEY (pokemon_id, move_name),
	FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokedex_id),
	FOREIGN KEY (move) REFERENCES moves(name)
);

CREATE TABLE specificpokemon (
	pokemon_id INTEGER PRIMARY KEY,
	pokedex_id INTEGER,
	move1 TEXT,
	move2 TEXT,
	move3 TEXT,
	move4 TEXT,
	FOREIGN KEY (pokedex_id) REFERENCES pokemon(pokedex_id),
	FOREIGN KEY (move1) REFERENCES moves(name),
	FOREIGN KEY (move2) REFERENCES moves(name),
	FOREIGN KEY (move3) REFERENCES moves(name),
	FOREIGN KEY (move4) REFERENCES moves(name)
);

CREATE TABLE team (
	teamid INTEGER PRIMARY KEY,
	poke1 INTEGER,
	poke2 INTEGER,
	poke3 INTEGER,
	poke4 INTEGER,
	poke5 INTEGER,
	poke6 INTEGER,
	FOREIGN KEY (poke1) REFERENCES specificpokemon(pokemon_id),
	FOREIGN KEY (poke2) REFERENCES specificpokemon(pokemon_id),
	FOREIGN KEY (poke3) REFERENCES specificpokemon(pokemon_id),
	FOREIGN KEY (poke4) REFERENCES specificpokemon(pokemon_id),
	FOREIGN KEY (poke5) REFERENCES specificpokemon(pokemon_id),
	FOREIGN KEY (poke6) REFERENCES specificpokemon(pokemon_id)
);

CREATE TABLE types (
	typename TEXT PRIMARY KEY
);

CREATE TABLE typeeffective (
	attackingtype TEXT,
	defendingtype TEXT,
	damagemultiplier INTEGER NOT NULL,
	PRIMARY KEY (attackingtype, defendingtype),
	FOREIGN KEY (attackingtype) REFERENCES types(typename),
	FOREIGN KEY (defendingtype) REFERENCES types(typename)
);


INSERT INTO types(typename) VALUES
('normal'),
('fire'),
('water'),
('electric'),
('grass'),
('ice'),
('fighting'),
('poison'),
('ground'),
('flying'),
('psychic'),
('bug'),
('rock'),
('ghost'),
('dragon'),
('dark'),
('steel'),
('fairy');


-- Normal type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('normal', 'normal', 1),
('normal', 'fire', 1),
('normal', 'water', 1),
('normal', 'electric', 1),
('normal', 'grass', 1),
('normal', 'ice', 1),
('normal', 'fighting', 2),
('normal', 'poison', 1),
('normal', 'ground', 1),
('normal', 'flying', 1),
('normal', 'psychic', 1),
('normal', 'bug', 1),
('normal', 'rock', 0.5),
('normal', 'ghost', 0),
('normal', 'dragon', 1),
('normal', 'dark', 1),
('normal', 'steel', 0.5),
('normal', 'fairy', 1);

-- Fire type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('fire', 'normal', 1),
('fire', 'fire', 0.5),
('fire', 'water', 0.5),
('fire', 'electric', 1),
('fire', 'grass', 2),
('fire', 'ice', 2),
('fire', 'fighting', 1),
('fire', 'poison', 1),
('fire', 'ground', 1),
('fire', 'flying', 1),
('fire', 'psychic', 1),
('fire', 'bug', 2),
('fire', 'rock', 0.5),
('fire', 'ghost', 1),
('fire', 'dragon', 0.5),
('fire', 'dark', 1),
('fire', 'steel', 2),
('fire', 'fairy', 1);

-- Water type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('water', 'normal', 1),
('water', 'fire', 2),
('water', 'water', 0.5),
('water', 'electric', 1),
('water', 'grass', 0.5),
('water', 'ice', 1),
('water', 'fighting', 1),
('water', 'poison', 1),
('water', 'ground', 2),
('water', 'flying', 1),
('water', 'psychic', 1),
('water', 'bug', 1),
('water', 'rock', 2),
('water', 'ghost', 1),
('water', 'dragon', 0.5),
('water', 'dark', 1),
('water', 'steel', 1),
('water', 'fairy', 1);

-- Electric type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('electric', 'normal', 1),
('electric', 'fire', 1),
('electric', 'water', 2),
('electric', 'electric', 0.5),
('electric', 'grass', 0.5),
('electric', 'ice', 1),
('electric', 'fighting', 1),
('electric', 'poison', 1),
('electric', 'ground', 0),
('electric', 'flying', 2),
('electric', 'psychic', 1),
('electric', 'bug', 1),
('electric', 'rock', 1),
('electric', 'ghost', 1),
('electric', 'dragon', 0.5),
('electric', 'dark', 1),
('electric', 'steel', 1),
('electric', 'fairy', 1);

-- Grass type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('grass', 'normal', 1),
('grass', 'fire', 0.5),
('grass', 'water', 2),
('grass', 'electric', 2),
('grass', 'grass', 0.5),
('grass', 'ice', 2),
('grass', 'fighting', 1),
('grass', 'poison', 0.5),
('grass', 'ground', 2),
('grass', 'flying', 0.5),
('grass', 'psychic', 1),
('grass', 'bug', 0.5),
('grass', 'rock', 2),
('grass', 'ghost', 1),
('grass', 'dragon', 0.5),
('grass', 'dark', 1),
('grass', 'steel', 0.5),
('grass', 'fairy', 1);

-- Ice type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('ice', 'normal', 1),
('ice', 'fire', 0.5),
('ice', 'water', 0.5),
('ice', 'electric', 1),
('ice', 'grass', 1),
('ice', 'ice', 0.5),
('ice', 'fighting', 1),
('ice', 'poison', 1),
('ice', 'ground', 1),
('ice', 'flying', 2),
('ice', 'psychic', 1),
('ice', 'bug', 1),
('ice', 'rock', 1),
('ice', 'ghost', 1),
('ice', 'dragon', 2),
('ice', 'dark', 1),
('ice', 'steel', 0.5),
('ice', 'fairy', 1);

-- Fighting type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('fighting', 'normal', 2),
('fighting', 'fire', 1),
('fighting', 'water', 1),
('fighting', 'electric', 1),
('fighting', 'grass', 1),
('fighting', 'ice', 1),
('fighting', 'fighting', 1),
('fighting', 'poison', 0.5),
('fighting', 'ground', 1),
('fighting', 'flying', 2),
('fighting', 'psychic', 0.5),
('fighting', 'bug', 0.5),
('fighting', 'rock', 2),
('fighting', 'ghost', 0),
('fighting', 'dragon', 1),
('fighting', 'dark', 2),
('fighting', 'steel', 2),
('fighting', 'fairy', 0.5);

-- Poison type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('poison', 'normal', 1),
('poison', 'fire', 1),
('poison', 'water', 1),
('poison', 'electric', 1),
('poison', 'grass', 2),
('poison', 'ice', 1),
('poison', 'fighting', 1),
('poison', 'poison', 0.5),
('poison', 'ground', 0.5),
('poison', 'flying', 1),
('poison', 'psychic', 1),
('poison', 'bug', 1),
('poison', 'rock', 1),
('poison', 'ghost', 1),
('poison', 'dragon', 1),
('poison', 'dark', 1),
('poison', 'steel', 1),
('poison', 'fairy', 2);

-- Ground type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('ground', 'normal', 1),
('ground', 'fire', 2),
('ground', 'water', 1),
('ground', 'electric', 2),
('ground', 'grass', 0.5),
('ground', 'ice', 1),
('ground', 'fighting', 1),
('ground', 'poison', 2),
('ground', 'ground', 1),
('ground', 'flying', 0),
('ground', 'psychic', 1),
('ground', 'bug', 1),
('ground', 'rock', 2),
('ground', 'ghost', 1),
('ground', 'dragon', 1),
('ground', 'dark', 1),
('ground', 'steel', 2),
('ground', 'fairy', 1);

-- Flying type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('flying', 'normal', 1),
('flying', 'fire', 1),
('flying', 'water', 1),
('flying', 'electric', 0.5),
('flying', 'grass', 2),
('flying', 'ice', 1),
('flying', 'fighting', 0.5),
('flying', 'poison', 1),
('flying', 'ground', 1),
('flying', 'flying', 1),
('flying', 'psychic', 1),
('flying', 'bug', 2),
('flying', 'rock', 0.5),
('flying', 'ghost', 1),
('flying', 'dragon', 1),
('flying', 'dark', 1),
('flying', 'steel', 0.5),
('flying', 'fairy', 1);

-- Psychic type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('psychic', 'normal', 1),
('psychic', 'fire', 1),
('psychic', 'water', 1),
('psychic', 'electric', 1),
('psychic', 'grass', 1),
('psychic', 'ice', 1),
('psychic', 'fighting', 2),
('psychic', 'poison', 2),
('psychic', 'ground', 1),
('psychic', 'flying', 1),
('psychic', 'psychic', 0.5),
('psychic', 'bug', 1),
('psychic', 'rock', 1),
('psychic', 'ghost', 1),
('psychic', 'dragon', 1),
('psychic', 'dark', 0),
('psychic', 'steel', 0.5),
('psychic', 'fairy', 1);

-- Bug type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('bug', 'normal', 1),
('bug', 'fire', 0.5),
('bug', 'water', 1),
('bug', 'electric', 1),
('bug', 'grass', 2),
('bug', 'ice', 1),
('bug', 'fighting', 0.5),
('bug', 'poison', 1),
('bug', 'ground', 0.5),
('bug', 'flying', 2),
('bug', 'psychic', 2),
('bug', 'bug', 1),
('bug', 'rock', 1),
('bug', 'ghost', 1),
('bug', 'dragon', 1),
('bug', 'dark', 1),
('bug', 'steel', 1),
('bug', 'fairy', 1);

-- Rock type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('rock', 'normal', 1),
('rock', 'fire', 2),
('rock', 'water', 1),
('rock', 'electric', 1),
('rock', 'grass', 1),
('rock', 'ice', 2),
('rock', 'fighting', 0.5),
('rock', 'poison', 1),
('rock', 'ground', 0.5),
('rock', 'flying', 2),
('rock', 'psychic', 1),
('rock', 'bug', 2),
('rock', 'rock', 1),
('rock', 'ghost', 1),
('rock', 'dragon', 1),
('rock', 'dark', 1),
('rock', 'steel', 0.5),
('rock', 'fairy', 1);

-- Ghost type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('ghost', 'normal', 0),
('ghost', 'fire', 1),
('ghost', 'water', 1),
('ghost', 'electric', 1),
('ghost', 'grass', 1),
('ghost', 'ice', 1),
('ghost', 'fighting', 1),
('ghost', 'poison', 1),
('ghost', 'ground', 1),
('ghost', 'flying', 1),
('ghost', 'psychic', 2),
('ghost', 'bug', 1),
('ghost', 'rock', 1),
('ghost', 'ghost', 2),
('ghost', 'dragon', 1),
('ghost', 'dark', 0.5),
('ghost', 'steel', 1),
('ghost', 'fairy', 1);

-- Dragon type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('dragon', 'normal', 1),
('dragon', 'fire', 1),
('dragon', 'water', 1),
('dragon', 'electric', 1),
('dragon', 'grass', 1),
('dragon', 'ice', 1),
('dragon', 'fighting', 1),
('dragon', 'poison', 1),
('dragon', 'ground', 1),
('dragon', 'flying', 1),
('dragon', 'psychic', 1),
('dragon', 'bug', 1),
('dragon', 'rock', 1),
('dragon', 'ghost', 1),
('dragon', 'dragon', 2),
('dragon', 'dark', 1),
('dragon', 'steel', 0.5),
('dragon', 'fairy', 0);

-- Dark type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('dark', 'normal', 1),
('dark', 'fire', 1),
('dark', 'water', 1),
('dark', 'electric', 1),
('dark', 'grass', 1),
('dark', 'ice', 1),
('dark', 'fighting', 0.5),
('dark', 'poison', 1),
('dark', 'ground', 1),
('dark', 'flying', 1),
('dark', 'psychic', 2),
('dark', 'bug', 1),
('dark', 'rock', 1),
('dark', 'ghost', 2),
('dark', 'dragon', 1),
('dark', 'dark', 0.5),
('dark', 'steel', 1),
('dark', 'fairy', 2);

-- Steel type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('steel', 'normal', 1),
('steel', 'fire', 0.5),
('steel', 'water', 0.5),
('steel', 'electric', 0.5),
('steel', 'grass', 1),
('steel', 'ice', 2),
('steel', 'fighting', 1),
('steel', 'poison', 1),
('steel', 'ground', 1),
('steel', 'flying', 1),
('steel', 'psychic', 1),
('steel', 'bug', 1),
('steel', 'rock', 2),
('steel', 'ghost', 1),
('steel', 'dragon', 1),
('steel', 'dark', 1),
('steel', 'steel', 0.5),
('steel', 'fairy', 2);

-- Fairy type interactions
INSERT INTO typeeffective (attackingtype, defendingtype, damagemultiplier) VALUES
('fairy', 'normal', 1),
('fairy', 'fire', 0.5),
('fairy', 'water', 1),
('fairy', 'electric', 1),
('fairy', 'grass', 1),
('fairy', 'ice', 1),
('fairy', 'fighting', 2),
('fairy', 'poison', 0.5),
('fairy', 'ground', 1),
('fairy', 'flying', 1),
('fairy', 'psychic', 1),
('fairy', 'bug', 1),
('fairy', 'rock', 1),
('fairy', 'ghost', 1),
('fairy', 'dragon', 0),
('fairy', 'dark', 0.5),
('fairy', 'steel', 0.5),
('fairy', 'fairy', 1);







