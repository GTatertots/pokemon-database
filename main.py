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

