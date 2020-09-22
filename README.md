# targets-dsfest

<!-- badges: start -->
<!-- badges: end -->

This repo contains slides and code for the talk 'Hit your reproducibility {targets}' at the UK Government Data Science Festival on 29 September 2020.

You can view the [slides](https://matt-dray.github.io/targets-dsfest/#1) in your browser (press <kbd>F</kbd> for fullscreen, <kbd>P</kbd> for presenter notes and <kbd>O</kbd> for a slide overview).

## What is {targets}?

The [{targets}](https://wlandau.github.io/targets/) package by [Will Landau]("https://wlandau.github.io/) is an R-focused solution for managing your analytical workflows.

What does that mean? {targets} ‘remembers’ the relationships between objects in your workflow. When you update your analysis, {drake} makes sure that only the impacted objects are re-run. This means you don’t have to recreate everything from scratch each time.

## Code

This repo also includes a demo for using the package.

The script `beavers-workflow.R` contains steps for executing the the {targets} pipeline in the file `_targets.R`, which renders the `beavers-report.Rmd` R Markdown file into the `beavers-report.html` file.

The example shows how to use:

* `tar_script()` to create a `_targets.R` file with, which is where your targets are created with `tar_targets()` and pulled together with `tar_pipeline()`
* `tar_manifest()` to check the configuration of your targets
* `tar_make()` to execute the pipeline, which caches outputs and metadata in a `_targets/` directory that can be read from with `tar_read()`
* `tar_visnetwork` to get a graph network visualisation of your pipeline
* `tar_outdated()` to see which targets need to be updated following a change to your code or data
* these functions to explore changes and to `tar_make()` it again to bring everything up to date
