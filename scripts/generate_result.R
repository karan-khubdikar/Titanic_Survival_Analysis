# author: Sampson Yu
# date: 2023-12-01

"Generates a summary table for a logistic regression model.

Usage: script.R --model_file=<model_file> --out_dir=<out_dir>

Options:
--model_file=<model_file> Path to the saved logistic regression model file (.rds).
--out_dir=<out_dir> Path to directory where the summary table should be saved (.rds).
" -> doc

source("R/modeling_analysis_functions.R")

library(tidyverse)
library(broom)
library(docopt)

# Parse command-line arguments
opt <- docopt(doc)

# Main function
main <- function(model_file, out_dir) {
  # Load the model
  model <- readRDS(model_file)

  # Create the summary table
  summary_table <- create_model_summary_table(model)

  # Save the summary table
  write.csv(summary_table, file = paste0(out_dir, "/model_summary_table.csv"))
}

# Execute the main function
main(opt[["--model_file"]], opt[["--out_dir"]])
