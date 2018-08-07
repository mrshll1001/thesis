#! /usr/bin/env bash

# Check directory exists
mkdir -p ./html

echo "Building HTML"


# Run the Pandoc command
pandoc src/index.md src/introduction.md src/lit_review.md src/methodoloy.md src/fieldwork_casestudy.md src/designing_accounting_tools.md src/evaluation.md src/discussion.md src/conclusions.md src/bibliography.md -o html/index.html -s --toc --filter=pandoc-citeproc

echo "HTML copy built under /html"
