#! /usr/bin/env bash

# Build the html
/bin/bash ./buildhtml.sh

# Send the html folder up to docker
echo "Sending to docker"

tar -cvf - . | ssh dokku@dig-civics.ncl.ac.uk tar:in mrshll-thesis

echo "Sent to docker"
