# Thesis
Working draft of my PhD Thesis.

+ source is in markdown
+ scripts build for various formats
+ scripts will build into an `out` directory and then a subdirectory for their specific format e.g. `out/html` or `out/tex`
+ `/out` is ignored by git, so you need to run a build script to acquire the desired format
+ Dockerfile contains configuration for pushing html output to [this url](https://openlab.ncl.ac.uk/dokku/mrshll-thesis/). Push using `./toDocker.sh` which will automatically build the html for you (obviously if you're not me this will reject your request)
+ `/templates` contains things such as custom css for the web version, and will contain custom latex templates for generating nice pdfs. Pandoc is run with the `--self-contained` method to pull in any resources to the output file
