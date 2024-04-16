#!/bin/bash
rm -f pokemon.db

sqlite3 pokemon.db < schema.sql

