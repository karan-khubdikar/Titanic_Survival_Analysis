library(testthat)
source("../../R/modeling_analysis_functions.R")

data <- data.frame(
  y = c(1, 0, 1, 1),
  x1 = c(3, 4, 5, 8),
  x2 = c(6, 7, 8, 10)
)

intercept_estimate <- 54.31
x1_estimate <- 17.87
x2_estimate <- -17.87