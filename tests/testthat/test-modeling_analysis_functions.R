library(testthat)
source("../../R/modeling_analysis_functions.R")
source('helper-modeling_analysis_functions.R')

test_that("`fit_logistic_model` should return a list", {
  expect_type(fit_logistic_model(data, "y", c("x1", "x2")), "list")
})

test_that("`fit_logistic_model` should return correct estimated intercept", {
  expect_equal(fit_logistic_model(data, "y", c("x1", "x2"))$coefficients[[1]],
              intercept_estimate,
              tolerance = 0.01)
})

test_that("`fit_logistic_model` should return correct estimated slope beta1", {
  expect_equal(fit_logistic_model(data, "y", c("x1", "x2"))$coefficients[[2]],
               x1_estimate,
               tolerance = 0.01)
})

test_that("`fit_logistic_model` should return correct estimated slope beta2", {
  expect_equal(fit_logistic_model(data, "y", c("x1", "x2"))$coefficients[[3]],
               x2_estimate,
               tolerance = 0.01)
})

test_data <- generate_test_data()
test_model <- fit_test_model(test_data)

# Get the expected output for comparison
expected_result <- expected_output()

# Define the tests for the create_model_summary_table function
test_that("create_model_summary_table returns a dataframe", {
  expect_s3_class(create_model_summary_table(test_model), "data.frame")
})

test_that("create_model_summary_table has correct structure", {
  result <- create_model_summary_table(test_model)
  expected_columns <- c("Term", "Estimate", "StdError", "zValue", "Pr")
  expect_identical(colnames(result), expected_columns)
})

test_that("create_model_summary_table correctly calculates summary statistics", {
  result <- create_model_summary_table(test_model)
  expect_equal(result$Estimate, expected_result$Estimate, tolerance = 1e-6)
  expect_equal(result$StdError, expected_result$StdError, tolerance = 1e-6)
  expect_equal(result$zValue, expected_result$zValue, tolerance = 1e-6)
  expect_equal(result$Pr, expected_result$Pr, tolerance = 1e-6)
})


test_that("create_model_summary_table handles incorrect input", {
  expect_error(create_model_summary_table(lm(outcome ~ predictor1 + predictor2, data = test_data)))
  expect_error(create_model_summary_table(NULL))
  expect_error(create_model_summary_table("not a model"))
})
