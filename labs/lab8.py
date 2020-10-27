import requests, re
from bs4 import BeautifulSoup

data = requests.get("https://www.tomshardware.com/reviews/best-gaming-laptops,4828.html").content

soup = BeautifulSoup(data, 'html.parser')
p = soup.find("div", {"class":"_hawk subtitle"})
best = p.text

span = soup.find("span", {"class":"hawk-display-price-price"})
price = span.text

span = soup.find("h3", {"id":"1-msi-ge66-raider"})
title = span.text

print("%s is the number %s and costs %s" %(best,title,price))

