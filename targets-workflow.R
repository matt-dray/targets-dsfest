# Hit your reproducibility {targets}!
# UK Government Data Science Festival, 2020-09-29
# This is a script file with a workflow like the one used in the presentation
# Slides available here: https://matt-dray.github.io/targets-dsfest/


# Install packages --------------------------------------------------------


# Install the packages if you haven't before
install.packages("remotes")
remotes::install_github("wlandau/targets")
remotes::install_github("wlandau/tarchetypes")

# Attach the {targets} package for this session
library(targets)


# Create targets script ---------------------------------------------------


# Generate a _targets.R script template to contain your pipeline
# {targets} knows to look here for your pipeline
tar_script()

# Now you can add your options, functions and targets to the _targets.R file.
# The _targets.R in this repo contains the pipeline that generates the example
# used in the 'Hit your reproducibility {targets}!' presentation.


# Manifest ----------------------------------------------------------------


# Once you've completed your _targets.R script, you can check the manifest for
# e.g. the commands in your pipeline
tar_manifest(fields = "command")

# This is a good function to run to make sure that the pipeline contains what
# you think it should before you execute it.

# Note that tar_manifest() looked for the _targets.R file and derived the
# information from it. We didn't have to specify the name of the file.


# Make --------------------------------------------------------------------

# When happy that the manifest reflects your pipeline, you can execute - or
# 'make' - the steps.
tar_make()

# This will print to the console each target as it's created. This also creates
# a _targets/ directory that contains a cache of the created objects and
# metadata about the pipeline execution.


# Inspect -----------------------------------------------------------------


# After you've run tar_make(), you can fetch the objects from the cache in the
# _targets/ directory.

# Check what's in the cache and the metadata associated with each object
tar_meta()

# Load an object from the cache into your workspace
tar_read(table)  # e.g. the 'table' object

# Create a visual representation (a network graph) of your pipeline based on
# the relationships between the targets
tar_visnetwork()


# Make changes ------------------------------------------------------------


# Let's say something in your workflow changed. What is now out of date?

tar_outdated()  # prints the targets that are out of date

tar_manifest()  # re-check the manifest to see if it's okay
tar_visnetwork()  # rebuild graph to see impacted targets
tar_make() # re-make the plan!

# tar_make() will print to the console that the unchanged targets are skipped
# (indicted with a tick) and that changed targets have been run (a circle).


# You can then rinse and repeat your process of making updates, then checking
# the changes and re-making the pipeline.
