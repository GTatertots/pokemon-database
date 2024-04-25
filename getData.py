import requests
import json

data = requests.get('https://pokeapi.co/api/v2/generation/1/').json()

for thing in data["types"]:
    print(thing)