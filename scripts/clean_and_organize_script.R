# Alan Powichrowski
# 2023-12-01

"Script to use the clean_and_organize_data function from the 
data_wrangling_functions.R file to clean the data, drop NAs, and bin the results.

Usage: R/clean_and_organize_script.R <data_file> <out_file>
" -> doc

library(docopt)

#source function
source("R/data_wrangling_functions.R")

opt <- docopt(doc)

#Main func
main <- function(data_file, out_file) {
  #Read in data
  dataset <- read.csv(data_file, stringsAsFactors = FALSE)
  
  #Run function
  cleaned_dataset <- clean_and_organize_data(dataset)
  
  #Output Data
  write.csv(cleaned_dataset, out_file, row.names = FALSE)
}

#Running main function with arguments
main(opt$data_file, opt$out_file)