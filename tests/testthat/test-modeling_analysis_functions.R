library(testthat)
source("../../R/modeling_analysis_functions.R")

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


