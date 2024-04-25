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

CREATE TABLE team (
	teamid INTEGER PRIMARY KEY,
	poke1 INTEGER,
	poke2 INTEGER,
	poke3 INTEGER,
	poke4 INTEGER,
	poke5 INTEGER,
	poke6 INTEGER,
	FOREIGN KEY (poke1) REFERENCES pokemon(pokedex_id),
	FOREIGN KEY (poke2) REFERENCES pokemon(pokedex_id),
	FOREIGN KEY (poke3) REFERENCES pokemon(pokedex_id),
	FOREIGN KEY (poke4) REFERENCES pokemon(pokedex_id),
	FOREIGN KEY (poke5) REFERENCES pokemon(pokedex_id),
	FOREIGN KEY (poke6) REFERENCES pokemon(pokedex_id)
);

CREATE TABLE typeeffective (
	attackingtype TEXT,
	defendingtype TEXT,
	damagemultiplier INTEGER NOT NULL,
	PRIMARY KEY (attackingtype, defendingtype),
	FOREIGN KEY (attackingtype) REFERENCES types(typename),
	FOREIGN KEY (defendingtype) REFERENCES types(typename)
);

CREATE TABLE types (
	typename TEXT PRIMARY KEY
);
