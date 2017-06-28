#!/bin/bash

cd tex

pandoc master.tex -f latex -t html --output="../html/output.html" -s --bibliography="bibliography.bib" -c styles.css --toc
