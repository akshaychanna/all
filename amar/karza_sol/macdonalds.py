import pdb
import sys
import pprint
import logging
from bs4 import BeautifulSoup
import requests
import pdb
import json


url = "https://www.mcdonalds.com/services/mcd/searchResults.json?country=us&language=en-us&q=new%20york&limit=100&page=0&pageType=All&hidePage=local-menu.html"
data = requests.get(url)
# pdb.set_trace()
soup = BeautifulSoup(data.content, 'html.parser')
for i in soup:
    dict_data = json.loads(i)
    data = dict_data["hits"]
    
    # pprint.pprint(i)
    # pdb.set_trace()
    # abc = i["hits"]
pdb.set_trace()
