# Alan Powichrowski
# 2023-11-01

"Script to use the select_columns function from the data_wrangling_functions.R 
file. Selects the columns wanted to data wrangling and anlysis.

Usage: R/use_select_columns_script.R <out_file>
" -> doc

library(docopt)
library(titanic)

# Source the file containing the select_columns function
source("R/data_wrangling_functions.R")

# Parse command-line arguments
opt <- docopt(doc)
# Main function
main <- function(out_file) {
  #Read the dataset
  dataset <- titanic_train
  
  # Split the columns and select
  selected_columns <- c("Survived", "Pclass", "Sex", 
                        "Age", "SibSp", "Parch", "Fare")
  selected_dataset <- select_columns(dataset, selected_columns)
  
  # Write the selected dataset to a file
  write.csv(selected_dataset, out_file, row.names = FALSE)
}

# Running the main function with arguments
main(opt$out_file)