
#Selecting the columns of interest from the data
#
# Args:
#   dataset: A dataframe from which to select columns.
#   columns: A vector of column names to be selected from the dataset.
#
# Returns:
#   A dataframe containing only the selected columns.
select_columns <- function(dataset, columns) {
  selected_dataset <- dataset[, columns]
  return(selected_dataset)
}

# Clean and organize the dataset
#
# This function performs data cleaning operations including dropping missing
# values, creating an age group category ("Child", "Teen", "Adult", "Senior"), 
# and converting certain variables to factors (AgeGroup and Pcalss).
#
# Args:
#   dataset: A dataframe that needs to be cleaned and organized.
#
# Returns:
#   A cleaned and organized dataframe with necessary transformations applied.
#
clean_and_organize_data <- function(dataset) {
  cleaned_dataset = na.omit(dataset)
  cleaned_dataset$AgeGroup <- ifelse(cleaned_dataset$Age < 13, "Child",
                                     ifelse(cleaned_dataset$Age <= 18, "Teen",
                                            ifelse(cleaned_dataset$Age <= 60, 
                                                   "Adult", "Senior")))
  final_dataset <- subset(cleaned_dataset, select = -Age)
  final_dataset$Pclass <- factor(final_dataset$Pclass)
  final_dataset$AgeGroup <- factor(final_dataset$AgeGroup, levels = c("Child", 
                                                                      "Teen", 
                                                                      "Adult", 
                                                                      "Senior"))
  final_dataset$Survived <- factor(final_dataset$Survived, 
                                   levels = c(0, 1))
  return(final_dataset)
}
