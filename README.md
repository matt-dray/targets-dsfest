# targets-dsfest

<!-- badges: start -->
<!-- badges: end -->

This repo contains slides and code for the talk 'Hit your reproducibility {targets}' at the UK Government Data Science Festival on 29 September 2020.

You can view the [slides](https://matt-dray.github.io/targets-dsfest/#1) in your browser.

The [{targets}](https://wlandau.github.io/targets/) package by [Will Landau]("https://wlandau.github.io/) is an R-focused solution for managing your analytical workflows.

What does that mean? {targets} ‘remembers’ the relationships between
objects in your workflow. When you update your analysis, {drake} makes
sure that only the impacted objects are re-run. This means you don’t
have to recreate everything from scratch each time.
