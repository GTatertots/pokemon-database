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
    print(f"--> created team: [{pokemon1},{pokemon2},{pokemon3},{pokemon4},{pokemon5},{[pokemon6}]")

@click.argument('team_id')
def type_coverage(team_id):
    with getdb() as con:
        c = con.cursor()
        c.execute("",team_id) #TODO
        coverage = c.fetchall()
        print(f"team {team_id} has a coverage of {coverage} types")
        con.commit()

cli.add_command(create_team)
cli.add_command(type_coverage)

@click.command()
def generate():
    people = 240
    fin = open("social-media-random-user-account-data.txt")
    for line in fin:
        words = line.split()
        email = words[0]
        username = words[1]
        password = words[2]

        with getdb() as con:
            cursor = con.cursor()
            cursor.execute('''INSERT INTO users (email) VALUES (?)''', (email,))
            id = cursor.lastrowid
            print(f'inserted with id = {id}')
        # adduser(email)
        
        with getdb() as con:
            cursor = con.cursor()
            cursor.execute('''INSERT INTO accounts (user_id, username, password) 
                VALUES ((SELECT user_id FROM users WHERE email = ?), ?, ?)''', (email, username, password))
            id = cursor.lastrowid
            print(f'inserted with id = {id}')
        # addaccount(email, username, password)
    for i in range(1,people):
        num1 = random.randrange(1, people)
        num2 = random.randrange(1, people)
        with getdb() as con:
            if num1 != num2:
                cursor = con.cursor()
                cursor.execute('''INSERT INTO followers(follower_id, following_id)
                    VALUES ((SELECT account_id FROM accounts WHERE user_id = ?), (SELECT account_id FROM accounts WHERE user_id = ?))''', (num1, num2))
            # addaccount(email, username, password)
    for i in range(1,people):
        num3 = random.randrange(1, people)
        num4 = random.randrange(1, people)
        with getdb() as con:
            if num1 != num2:
                cursor = con.cursor()
                cursor.execute('''INSERT INTO subscribers(subscriber_id, subscribing_id)
                    VALUES ((SELECT account_id FROM accounts WHERE user_id = ?), (SELECT account_id FROM accounts WHERE user_id = ?))''', (num3, num4))
    for i in range(1, people):
        num5 = random.randrange(1, people)
        num6 = random.randrange(1, people)
        with getdb() as con:
            if num1 != num2:
                cursor = con.cursor()
                cursor.execute('''INSERT INTO blocks(blocked_id, blocker_id)
                    VALUES ((SELECT account_id FROM accounts WHERE user_id = ?), (SELECT account_id FROM accounts WHERE user_id = ?))''', (num3, num4))
                




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

