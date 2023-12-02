# Scripts to generate the financial and personal plots

"
Usage: scripts/EDA_scripts.r --dataset=<dataset> --out_dir=<out_dir>
Options:
--dataset=<dataset> Path (including filename) to plotting data
--out_dir=<out_dir> Path to directory where the plots should be saved
" -> doc

source("R/EDA_functions.R")

library(docopt)
library(tidyverse)
library(ggplot2)

opt <- docopt(doc)

main <- function(dataset, out_dir){

data <- read.csv(dataset)
# Financial plot
{
  ggsave(paste0(out_dir,"/financial_plot.png"),plot_financial_info(data))
}

# personal plot
{
  ggsave(paste0(out_dir,"/personal_plot.png"),plot_personal_attributes(data))
}
}

main(opt[["--dataset"]], opt[["--out_dir"]])