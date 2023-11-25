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

# Test for Fare Distribution Plot
test_that("Fare Distribution Plot has correct elements", {
  fare_plot <- plot_financial_info(test_data)
  expect_true("GeomHistogram" %in% c(class(fare_plot$layers[[1]]$geom)))  # Check if it's a histogram
  expect_that(fare_plot$labels$title, is_not(NULL))  
  expect_that(fare_plot$labels$x, is_not(NULL))  
  expect_that(fare_plot$labels$y, is_not(NULL))  
})

# Test for Survival by Fare Plot
test_that("Survival by Fare Plot has correct elements", {
  survival_by_fare_plot <- plot_financial_info(test_data)
  expect_true("GeomHistogram" %in% c(class(survival_by_fare_plot$layers[[1]]$geom))) # Check if it's a histogram
  expect_that(survival_by_fare_plot$labels$title, is_not(NULL))
  expect_that(survival_by_fare_plot$labels$x, is_not(NULL))
  expect_that(survival_by_fare_plot$labels$y, is_not(NULL))
})

# Test for Passenger Class Plot
test_that("Passenger Class Plot has correct elements", {
  class_plot <- plot_financial_info(test_data)
  expect_true("GeomBar" %in% c(class(class_plot$layers[[1]]$geom))) # Check if it's a barplot
  expect_that(class_plot$labels$title, is_not(NULL))
  expect_that(class_plot$labels$x, is_not(NULL))
  expect_that(class_plot$labels$y, is_not(NULL))
})

# Test for Passenger Sex Plot
test_that("Passenger Class Plot has correct elements", {
  class_plot <- plot_personal_attributes(test_data)
  expect_true("GeomBar" %in% c(class(class_plot$layers[[1]]$geom))) # Check if it's a barplot
  expect_that(class_plot$labels$title, is_not(NULL))
  expect_that(class_plot$labels$x, is_not(NULL))
  expect_that(class_plot$labels$y, is_not(NULL))
})

# Test for Passenger Agegroup Plot
test_that("Passenger Class Plot has correct elements", {
  class_plot <- plot_personal_attributes(test_data)
  expect_true("GeomBar" %in% c(class(class_plot$layers[[1]]$geom))) # Check if it's a barplot
  expect_that(class_plot$labels$title, is_not(NULL))
  expect_that(class_plot$labels$x, is_not(NULL))
  expect_that(class_plot$labels$y, is_not(NULL))
})