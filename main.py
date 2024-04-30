#!/usr/bin/env python3

import click
import os
import sqlite3
import sys
from datetime import datetime

DB_FILE = 'pokemon.db'

def getdb():
    con = sqlite3.connect(DB_FILE)
    con.execute('PRAGMA foreign_keys = ON')
    return con

@click.group()
def cli():
    pass

@click.command()
@click.argument('pokedex_id')
@click.argument('move1')
@click.argument('move2')
@click.argument('move3')
@click.argument('move4')
def create_specific_pokemon(pokedex_id, move1, move2, move3, move4):
    with getdb() as con:
        c = con.cursor()
        c.execute("INSERT INTO specificpokemon (pokedex_id, move1, move2, move3, move4) VALUES (?,?,?,?,?)", (pokedex_id, move1, move2, move3, move4))
        con.commit()
    print(f"--> New Pokemon caught with id: {pokedex_id} with: {move1}, {move2}, {move3}, and {move4}")



@click.command()
@click.argument('pokemon1')
@click.argument('pokemon2')
@click.argument('pokemon3')
@click.argument('pokemon4')
@click.argument('pokemon5')
@click.argument('pokemon6')
def create_team(pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6):
    with getdb() as con:
        c = con.cursor()
        c.execute("INSERT INTO team (poke1, poke2, poke3, poke4, poke5, poke6) VALUES (?,?,?,?,?,?)", (pokemon1, pokemon2, pokemon3, pokemon4, pokemon5, pokemon6))
        con.commit()
    print(f"--> created team: [{pokemon1},{pokemon2},{pokemon3},{pokemon4},{pokemon5},{pokemon6}]")

@click.command()
@click.argument('team_id')
def team_coverage(team_id):
    #this query would look through all the pokemon on a team and sum up how many different types their moves cover
    with getdb() as con:
        c = con.cursor()
        c.execute("",team_id) #TODO
        coverage = c.fetchall()
        print(f"team {team_id} has a coverage of {coverage} types")
        con.commit()

@click.command()
def best_coverage():
    #this query could look through every pokemon's possible moves and see which pokemon have the best coverage possibility (top 10?)
    #tie could be settled with Base Stat Total
    with getdb() as con:
        c = con.cursor()
        c.execute("") #TODO
        data = c.fetchall()
        print(data)
        con.commit()

@click.command()
@click.argument('team_id')
@click.argument('enemy_pokemon')
def counterpick(team_id,enemy_pokemon):
    #this query could look through the team provided and see which pokemon has the best attack advantage over the provided enemy pokemon
    with getdb() as con:
        c = con.cursor()
        c.execute("""
            SELECT pokemon_a.pokemon_id, SUM(damagemultiplier) AS score
            FROM team
            JOIN specificpokemon AS pokemon_a
                ON (pokemon_a.pokemon_id = poke1
                OR pokemon_a.pokemon_id = poke2
                OR pokemon_a.pokemon_id = poke3
                OR pokemon_a.pokemon_id = poke4
                OR pokemon_a.pokemon_id = poke5
                OR pokemon_a.pokemon_id = poke6)
            JOIN moves
                ON (moves.name = pokemon_a.move1
                OR moves.name = pokemon_a.move2
                OR moves.name = pokemon_a.move3
                OR moves.name = pokemon_a.move4)
            JOIN typeeffective
                ON attackingtype = moveType
            JOIN pokemon
                ON (defendingtype = type1
                OR defendingtype = type2)
            JOIN specificpokemon AS pokemon_b
                ON pokemon.pokedex_id = pokemon_b.pokedex_id
            
            WHERE teamid = ?
            AND pokemon_b.pokemon_id = ?
            
            GROUP BY pokemon_a.pokemon_id
            ORDER BY score
                """, (team_id, enemy_pokemon))
        pokemon = c.fetchall()
        print(pokemon)
        con.commit()


@click.command()
def topBST():
    with getdb() as con:
        c = con.cursor()
        c.execute("SELECT Name, BST FROM pokemon ORDER BY bst DESC LIMIT 10") #TODO
        data = c.fetchall()
        print(data)
        con.commit()

cli.add_command(create_specific_pokemon)
cli.add_command(create_team)
cli.add_command(team_coverage)
cli.add_command(best_coverage)
cli.add_command(counterpick)
cli.add_command(topBST)
cli()

#EXAMPLE ON HOW TO DO CLI
#@click.group()
#def cli():
#    pass
#
#@click.command()
#@click.argument('email_addr')
#def insert_user(email_addr):
#    with getdb() as con:
#        c = con.cursor()
#        c.execute("INSERT INTO users (email_address) VALUES (?)", (email_addr,))
#        con.commit()
#    print("--> created user:", email_addr)
#
#cli.add_command(insert_user)

