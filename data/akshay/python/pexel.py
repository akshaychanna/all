from bs4 import *
import os
import requests as rq
import pdb

r2 = rq.get("https://www.pexels.com/@hiteshchoudhary")
#pdb.set_trace()

soup2 = BeautifulSoup(r2.content, "html.parser")


links = []
pdb.set_trace()
x = soup2.select('img[src^="https://images.pexels.com/@hiteshchoudhary"]')
ab = ["a","b"]

print(soup2)
for img in ab:
#	links.append(img['src'])
#	pdb.set_trace()
	print("hello")



#pdb.set_trace()
#print("007")
