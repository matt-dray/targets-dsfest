# Hit your reproducibility {targets}!
# UK Government Data Science Festival, 2020-09-29

# This script was generated in the working directory by tar_script() and then I
# added the code for my pipeline. This is the example pipeline for generating
# a report on beavers that I used in the talk.

# Attach {targets} by default
library(targets)

# This is an example target script.
# Read the tar_script() help file for details.

# Define custom functions and other global objects.
# This is where you write source(\"R/functions.R\")
# if you keep your functions in external scripts.

# Simple bespoke plot function
b_plot <- function(data, image) {
  ggplot(data, aes(id, temp)) +
    geom_boxplot() +
    labs(title = "Beaver temperature") +
    add_phylopic(image)
}

# Simple bespoke summary table
b_table <- function(data) {
  data %>%
    group_by(id) %>%
    summarise(
      mean = mean(temp), sd = sd(temp),
      min = min(temp, max = max(temp)),
      .groups = "drop"
    )
}

# Set target-specific options such as packages.
tar_option_set(
  packages = c(
    "targets", "tarchetypes",
    "dplyr", "ggplot2", "rphylopic",
    "knitr"
  )
)

# Define targets
targets <- list(
  # Prepare inputs
  tar_target(b1, mutate(beaver1, id = "A")),
  tar_target(b2, mutate(beaver2, id = "B")),
  tar_target(beavers, bind_rows(b1, b2)),
  tar_target(uid, "be8670c2-a5bd-4b44-88e8-92f8b0c7f4c6"),
  tar_target(png, image_data(uid, size = "512")[[1]]),
  # Prepare outputs
  tar_target(plot, b_plot(beavers, png)),
  tar_target(table, b_table(beavers)),
  # Create report
  tarchetypes::tar_render(report, "beavers-report.Rmd")
)

# End with a call to tar_pipeline() to wrangle the targets together.
# This target script must return a pipeline object.
tar_pipeline(targets)
