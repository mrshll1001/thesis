#!/usr/bin/env python3

from bs4 import BeautifulSoup
from datetime import datetime
from git import Repo                # pip install gitpython
from jinja2 import Environment, FileSystemLoader

# Load the template

env = Environment(loader=FileSystemLoader('templates'))
template = env.get_template("index.html")

# Get the last updated
date = datetime.now()
last_updated = date.strftime("%A %d %B %Y at %H:%M")


# Look at the git logs, write a table, insert it into the template

commits_to_print = 10
repo = Repo("./")

if not repo.bare:
    commits = list(repo.iter_commits('master'))[:commits_to_print] # limit commit number

    # Write output
    output = open("./out/website/index.html", "w")
    output.write(template.render(last_updated=last_updated, commits=commits))
    output.close()





else:
    print("Couldn't get the git repository. Proceeding without it")
