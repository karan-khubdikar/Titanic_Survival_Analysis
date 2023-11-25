library(testthat)
source("../../R/data_wrangling_functions.R")

#Testing our select_columns() function

test_that("`select_columns` should return dataframe with specified columns", 
          {
  test_df <- data.frame(a = 1:3, b = 4:6, c = 7:9)
  result <- select_columns(test_df, c("a", "b"))
  expect_true(all(colnames(result) %in% c("a", "b")))
  expect_equal(ncol(result), 2)
})

test_that("`select_columns` should return dataframe with specified columns", 
          {
            test_df <- data.frame(a = 1:3, b = 4:6, c = 7:9)
            result <- select_columns(test_df, c("a", "b", "c"))
            expect_true(all(colnames(result) %in% c("a", "b", "c")))
            expect_equal(ncol(result), 3)
          })

#Testing clean_and_organize_data() function

test_that("`clean_and_preprocess_data` should remove rows with NA values", {
  test_df <- data.frame(Survived = c(1, 0, 1, 0, 1, 1), 
                        Pclass = c(1, 2, 2, 2, 2, 1), 
                        Sex = c("male", "female", "male", "female", "male", "female"), 
                        Age = c(2, NA, 30, 14, 70, 15), 
                        SibSp = c(1, 0, 3, 0, 3, 2), 
                        Parch = c(0, 1, 2, 1, 2, NA), 
                        Fare = c(7.25, 71.28, 10.0, 71.28, 10.0, 40.0),
                        Extra = c('stuff', 'stuff', 'stuff', 'stuff', 'stuff', 'stuff'),
                        Extra2 = c('stuff', 'stuff', 'stuff', 'stuff', 'stuff', 'stuff'))
  result <- clean_and_organize_data(test_df)
  expect_equal(nrow(result), 4)
})

test_that("`clean_and_organize_data` should correctly bin 'Age' into 'AgeGroup' and remove 'Age'", {
  test_df <- data.frame(Survived = c(1, 0, 1, 0, 1, 1), 
                        Pclass = c(1, 2, 2, 2, 2, 1), 
                        Sex = c("male", "female", "male", "female", "male", "female"), 
                        Age = c(2, NA, 30, 14, 70, 15), 
                        SibSp = c(1, 0, 3, 0, 3, 2), 
                        Parch = c(0, 1, 2, 1, 2, NA), 
                        Fare = c(7.25, 71.28, 10.0, 71.28, 10.0, 40.0),
                        Extra = c('stuff', 'stuff', 'stuff', 'stuff', 'stuff', 'stuff'),
                        Extra2 = c('stuff', 'stuff', 'stuff', 'stuff', 'stuff', 'stuff'))
  result <- clean_and_organize_data(test_df)
  expect_true("AgeGroup" %in% colnames(result))
  expect_false("Age" %in% colnames(result))
  expect_true(all(result$AgeGroup %in% c("Child", "Teen", "Adult", "Senior")))
})

test_that("`clean_and_organize_data` should factor 'Pclass' and 'AgeGroup'", {
  test_df <- data.frame(Survived = c(1, 0, 1, 0, 1, 1), 
                        Pclass = c(1, 2, 2, 2, 2, 1), 
                        Sex = c("male", "female", "male", "female", "male", "female"), 
                        Age = c(2, NA, 30, 14, 70, 15), 
                        SibSp = c(1, 0, 3, 0, 3, 2), 
                        Parch = c(0, 1, 2, 1, 2, NA), 
                        Fare = c(7.25, 71.28, 10.0, 71.28, 10.0, 40.0),
                        Extra = c('stuff', 'stuff', 'stuff', 'stuff', 'stuff', 'stuff'),
                        Extra2 = c('stuff', 'stuff', 'stuff', 'stuff', 'stuff', 'stuff'))
  result <- clean_and_organize_data(test_df)
  expect_s3_class(result$Pclass, "factor")
  expect_s3_class(result$AgeGroup, "factor")
})

