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


# Helper function to generate test data for logistic regression
generate_test_data <- function() {
  set.seed(123)
  data.frame(
    outcome = rbinom(100, 1, 0.5),
    predictor1 = rnorm(100),
    predictor2 = rnorm(100)
  )
}

# Helper function to fit a test logistic regression model
fit_test_model <- function(data) {
  glm(outcome ~ predictor1 + predictor2, data = data, family = "binomial")
}

# Expected output for logistic regression test model
expected_output <- function() {
  data.frame(
    Term = c("(Intercept)", "predictor1", "predictor2"),
    Estimate = c(-0.14261734, -0.36458699, -0.07190108),  
    StdError = c(0.2039994, 0.2186326, 0.2189358), 
    zValue = c(-0.6991065, -1.6675783, -0.3284118), 
    Pr = c(0.48448547, 0.09539946, 0.74260034)  
  )
}