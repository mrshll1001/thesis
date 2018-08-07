#! /usr/bin/env bash

# Check directory exists
mkdir -p ./out/tex

echo "Building LaTeX"


# Run the Pandoc command
pandoc src/index.md src/introduction.md src/lit_review.md src/methodoloy.md src/fieldwork_casestudy.md src/designing_accounting_tools.md src/evaluation.md src/discussion.md src/conclusions.md src/bibliography.md -o out/tex/thesis.tex -s --toc --toc-depth=2 --filter=pandoc-citeproc --self-contained

echo "LaTeX copy built under /out/tex (NOTE: This is not compiled as a pdf)"
