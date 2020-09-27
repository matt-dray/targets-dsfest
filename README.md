# targets-dsfest

<!-- badges: start -->
[![rostrum.blog post](https://img.shields.io/badge/rostrum.blog-post-008900?style=flat&labelColor=black&logo=data:image/gif;base64,R0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh+QQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2020/09/27/targets-dsfest/)
<!-- badges: end -->

This repo contains slides and code for the talk 'Hit your reproducibility {targets}' at the UK Government Data Science Festival on 29 September 2020.

You can [view the slides in your browser](https://matt-dray.github.io/targets-dsfest/#1) (press <kbd>F</kbd> for fullscreen, <kbd>P</kbd> for presenter notes and <kbd>O</kbd> for a slide overview).

## What is {targets}?

The [{targets}](https://wlandau.github.io/targets/) package by [Will Landau]("https://wlandau.github.io/) is an R-focused solution for managing your analytical workflows.

What does that mean? {targets} ‘remembers’ the relationships between objects in your workflow. When you update your analysis, {targets} makes sure that only the impacted objects are re-run. This means you don’t have to recreate everything from scratch each time.

## Demo code

This repo also includes files used as part of a {targets} demo used in the slides:

* `targets.R` contains the pipeline
* `run-pipeline-beavers.R` has code to execute and inspect the pipeline
* `_targets/` is the cache of objects and metadata (like {targets} 'memory')
* `report-beavers.Rmd` is a dummy R Markdown report to be rendered in the pipeline
* `report-beavers-mistake.html` is a rendered version of the R Markdown file, but it has an error!
* `report-beavers.html` is the final rendered version of the R Markdown after the mistake is corrected

The slides describe an example using these materials, but in short:

1. `tar_script()` creates a `_targets.R` file, which is where you declare you write functions and options and create your targets with `tar_targets()`, declaring the pipeline with `tar_pipeline()`
1. `tar_manifest()` lets you check the configuration of your targets
1. `tar_visnetwork` visualises your pipeline as a graph network
1. `tar_make()` executes your pipeline, which caches outputs and metadata in a `_targets/` directory that can be read from with `tar_read()` and `tar_load()`
1. `tar_outdated()` prints any targets that need to be updated following any changes to other targets, after which you can reinspect your pipeline and re-make it
