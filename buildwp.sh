#! /usr/bin/env bash

# Check directory exists
mkdir -p ./out/word-processor

echo "Building OpenDocument (.odt)"

# Run the Pandoc command
pandoc src/index.md src/introduction.md src/lit_review.md src/methodoloy.md src/fieldwork_casestudy.md src/designing_accounting_tools.md src/evaluation.md src/discussion.md src/conclusions.md src/bibliography.md -o out/word-processor/thesis.odt -s --toc --filter=pandoc-citeproc

echo "Building MS Document (.docx)"

pandoc src/index.md src/introduction.md src/lit_review.md src/methodoloy.md src/fieldwork_casestudy.md src/designing_accounting_tools.md src/evaluation.md src/discussion.md src/conclusions.md src/bibliography.md -o out/word-processor/thesis.docx -s --toc --filter=pandoc-citeproc
