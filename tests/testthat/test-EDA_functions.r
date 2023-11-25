library(testthat)
source("../../R/EDA_functions.R") 


test_data <- data.frame(
  Survived = factor(c(1, 1, 0, 1)),
  Pclass = factor(c(1, 2, 2, 2)),
  Sex = c("male", "male", "female", "male"),
  SibSp = c(1, 3, 0, 3),
  Parch = c(0, 2, 1, 2),
  Fare = c(7.25, 10.00, 71.28, 10.00),
  AgeGroup = factor(c("Child", "Adult", "Teen", "Senior"))
)

financial_plot <- plot_financial_info(test_data)
# Test Case 1: Check if grid.arrange returns a list
test_that("grid.arrange returns a list", {
  
  # Test: Check if it's a list
  expect_true(is.list(financial_plot))
})

# Test Case 2: Check if the correct number of plots are arranged
test_that("grid.arrange arranges the correct number of plots", {
  
  # 3 plots are arranged
  expected_plots <- 3
  
  # Test: Check if the number of arranged plots matches the expected value
  expect_equal(length(financial_plot), expected_plots)
})


personal_plot <- plot_personal_attributes(test_data)
# Test Case 1: Check if grid.arrange returns a list
test_that("grid.arrange returns a list", {
  
  # Test: Check if it's a list
  expect_true(is.list(personal_plot))
})

# Test Case 2: Check if the correct number of plots are arranged
test_that("grid.arrange arranges the correct number of plots", {
  
  # 2 plots are arranged
  expected_plots <- 2
  
  # Test: Check if the number of arranged plots matches the expected value
  expect_equal(length(personal_plot), expected_plots)
})
