# author: Sampson Yu
# date: 2023-12-01

"Generates a summary table for a logistic regression model.

Usage: script.R --model_file=<model_file> --out_dir=<out_dir>

Options:
--model_file=<model_file> Path to the saved logistic regression model file (.rds).
--out_dir=<out_dir> Path to directory where the summary table should be saved (.rds).
" -> doc

library(tidyverse)
library(broom)
library(docopt)

# Creates a summary table for a logistic regression model
#
# This function takes a fitted logistic regression model and produces
# a summary table. The table includes terms, estimates, standard errors,
# z-values, and p-values for each coefficient.
#
# Args:
#   model: A glm object representing a fitted logistic regression model.
#
# Returns:
#   A dataframe containing the summary statistics of the model coefficients.
create_model_summary_table <- function(model) {
  model_summary <- summary(model)

  results_table <- data.frame(
    Term = rownames(model_summary$coefficients),
    Estimate = model_summary$coefficients[, "Estimate"],
    StdError = model_summary$coefficients[, "Std. Error"],
    zValue = model_summary$coefficients[, "z value"],
    Pr = model_summary$coefficients[, "Pr(>|z|)"]
  )

  return(results_table)
}

# Parse command-line arguments
opt <- docopt(doc)

# Main function
main <- function(model_file, out_dir) {
  # Load the model
  model <- readRDS(model_file)

  # Create the summary table
  summary_table <- create_model_summary_table(model)

  # Save the summary table
  saveRDS(summary_table, file = paste0(out_dir, "/model_summary_table.rds"))
}

# Execute the main function
main(opt[["--model_file"]], opt[["--out_dir"]])
