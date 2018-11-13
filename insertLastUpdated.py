#!/usr/bin/env python3

from bs4 import BeautifulSoup
import datetime

# Read the website frontpage
html = open("./templates/index.html", "r")
soup = BeautifulSoup(html, 'html.parser')

# Insert the Last Modified Date
date = soup.find(id="last_updated_date")
date.string = str(datetime.datetime.now())

# Write output
output = open("./out/website/index.html", "w")
output.write(soup.prettify())
output.close()
