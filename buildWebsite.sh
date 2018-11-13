#! /usr/bin/env bash

# Build the html
/bin/bash ./buildhtml.sh
/bin/bash ./buildwp.sh

# Send the html folder up to docker
echo "Setting up file structure"

mkdir -p ./out/website

cp ./templates/web.css ./out/website

cp ./out/html/thesis.html ./out/website
cp ./out/word-processor/thesis.docx ./out/website

# Modify index.html to include the last updated with the git log
