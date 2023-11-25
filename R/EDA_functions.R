# Generates plots related to financial aspects of Titanic passengers
#
# This function creates visualizations for the distribution of fare prices,
# survival rates by fare paid, and survival rates by passenger class. It helps
# in understanding the financial aspects related to the survival of passengers.
# Specifically produces distribution and proportion plots of Fare Price,
# and Passenger Class by Survival Status (target)
#
# Args:
#   dataset: A dataframe containing Titanic passenger data.
#
# Returns:
#   None. The function directly plots the graphs.
plot_financial_info <- function(dataset) {
  library(ggplot2)
  library(gridExtra)
  
  # Fare Distribution Plot
  fare_plot <- ggplot(dataset, 
                      aes(x = Fare)) +
    geom_histogram(bins = 30, 
                   fill = "deepskyblue", 
                   color = "black") +
    theme_minimal() +
    labs(title = "Distribution of Fare Price across Titanic Patrons", 
         x = "Fare Price", 
         y = "Count")
  
  # Survival by Fare Plot
  survival_by_fare_plot <- ggplot(dataset, 
                                  aes(x = Fare, 
                                      fill = factor(Survived))) +
    geom_histogram(position = "fill", 
                   bins = 30, 
                   color = "black") +
    scale_fill_manual(values = c("coral1", "deepskyblue"),
                      labels = c("Did Not Survive", "Survived"),
                      name = "Survival Status") +
    theme_minimal() +
    labs(title = "Survival by Fare Paid", x = "Fare Price", y = "Proportion")
  
  # Passenger Class Plot
  class_plot <- ggplot(dataset, aes(x = Pclass, fill = factor(Survived))) +
    geom_bar(position = "fill", color = "black") +
    scale_fill_manual(values = c("coral1", "deepskyblue"), 
                      labels = c("Did Not Survive", "Survived"),
                      name = "Survival Status") +
    theme_minimal() +
    labs(title = "Survival by Passenger Class (Ticket Class of Passenger)", 
         x = "Passenger Class", y = "Proportion")
  
  # Arrange and display the plots
  grid.arrange(fare_plot, survival_by_fare_plot, class_plot, ncol=1)
}


# Generates plots related to personal attributes of Titanic passengers
#
# This function creates visualizations for the survival rates based on sex 
# and age group of the passengers. It helps in understanding how these personal 
# attributes might have influenced the survival chances from the Titanic. 
#
# Args:
#   dataset: A dataframe containing Titanic passenger data.
#
# Returns:
#   None. The function directly plots the graphs.
plot_personal_attributes <- function(dataset) {
  library(ggplot2)
  library(gridExtra)
  
  # Sex Plot
  sex_plot <- ggplot(dataset, aes(x = Sex, fill = factor(Survived))) +
    geom_bar(position = "fill", color = "black") +
    scale_fill_manual(values = c("coral1", "deepskyblue"), 
                      labels = c("Did Not Survive", "Survived"),
                      name = "Survival Status") +
    theme_minimal() +
    labs(title = "Survival of Incident by Sex", 
         x = "Sex", 
         y = "Proportion")
  
  # Age Group Plot
  age_plot <- ggplot(dataset, aes(x = AgeGroup, fill = factor(Survived))) +
    geom_bar(position = "fill", color = "black") +
    scale_fill_manual(values = c("coral1", "deepskyblue"), 
                      labels = c("Did Not Survive", "Survived"),
                      name = "Survival Status") +
    theme_minimal() +
    labs(title = "Survival of Incident by Age Group", 
         x = "Age Group", 
         y = "Proportion")
  
  # Arrange and display the plots
  grid.arrange(sex_plot, age_plot, ncol=2)
}