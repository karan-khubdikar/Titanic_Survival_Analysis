"This function fits a logistic regression model using the specified
target variable and a set of features provided by the user.
It is designed to work with binary classification problems.

Usage: R/fit_logistic_model.R <dataset_path> <target> <features> <output_path>
" -> doc

library(stats)
library(tidyverse)
library(docopt)
source("R/modeling_analysis_functions.R")

opt <- docopt(doc)

main <- function(dataset_path, target, features, output_path) {
  dataset <- read_csv(dataset_path)
  logistic_model <- fit_logistic_model(dataset, target, features)

  saveRDS(logistic_model, file = paste0(output_path, "/logistic_model.rds"))
}

main(opt$dataset_path, opt$target, opt$features, opt$output_path)
