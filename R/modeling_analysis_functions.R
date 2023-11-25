# Fits a logistic regression model on the given dataset
#
# This function fits a logistic regression model using the specified 
# target variable and a set of features provided by the user. 
# It is designed to work with binary classification problems.
#
# Args:
#   dataset: A dataframe containing the data to model.
#   target: A string specifying the name of the target variable in the dataset,
#           this value must be factored.
#   features: A vector of strings specifying the names of the features to 
#             include in the model.
#
# Returns:
#   A glm object representing the fitted logistic regression model.
#
# Example:
#   features_to_use <- c("Pclass", "Sex", "SibSp", "Parch", "Fare", "AgeGroup")
#   target_variable <- "Survived"
#   model <- fit_logistic_model(final_titanic_dataset, 
#                                     target_variable, 
#                                     features_to_use)

fit_logistic_model <- function(dataset, target, features) {
  # Ensure the target variable is a factor (for logistic regression)
  dataset[[target]] <- factor(dataset[[target]])
  
  # Create the formula for the model
  formula_str <- paste(target, "~", paste(features, collapse = " + "))
  formula <- as.formula(formula_str)
  
  # Fit the logistic regression model
  logistic_model <- glm(formula, data = dataset, family = binomial())
  
  return(logistic_model)
}