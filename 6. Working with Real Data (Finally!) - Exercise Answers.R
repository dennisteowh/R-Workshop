# Exercise

# The following questions are common problems when handling real data (e.g., handling missing cases, summarizing group statistics). 
# Ideally, you would be able to write a function to solve each of these problems.
# If your function works on general cases, then you can use them in your future work (and not just the dataset given by the problem)!
# However, given the difficulty level, you should start with just solving the problems first.
# You can always focus on abstracting your solution into a function later on.

# Use the CovidStrength dataset for the following problems:

library(readr)
setwd("C:/Users/user/Dropbox/NCSS/R Workshop")
CovidStrength <- read_csv("Data/CovidStrength.csv")

## 1) Create a new dataframe to summarize the missing data in CovidStrength. 
##    For each variable in CovidStrength, report the total number of missing data points,
##    the total number of data points, and the percentage of missing data.

## If you are writing a function, it should be able to summarize the missing data for a range of input dataframes.

# assess NA, handling NA
report_na <- function(df){
  output <- data.frame(matrix(nrow = ncol(df),ncol = 4))
  colnames(output) <- c("Variable", "Missing", "Total", "Missing (%)")
  for(i in 1:ncol(df)){
    variable <- df[[colnames(df)[i]]]
    output[i, "Variable"] <- colnames(df)[i]
    output[i, "Missing"] <- sum(is.na(variable))
    output[i, "Total"] <- length(variable)
    output[i, "Missing (%)"] <- paste(round(100*output[i, "Missing"]/output[i, "Total"],1), "%" )
  }
  return(output)
}

report_na(CovidStrength)

## 2) Remove the variables in CovidStrength with more than 30% of missing data.

## If you are writing a function, it should be able to work on a range of input dataframes.
## Ideally, you can also specify the threshold of missingness (in this case 30%) where you would remove the variable.

remove_missingness <- function(df, threshold){
  index_to_remove <- c()
  for(i in 1:ncol(df)){
    variable <- df[[colnames(df)[i]]]
    na_prob <- sum(is.na(variable))/length(variable)
    if(na_prob > threshold){
      index_to_remove <- c(index_to_remove, i)
    }
  }
  return(df[,-index_to_remove])
}

CovidStrength_lessna <- remove_missingness(CovidStrength, .3)
report_na(CovidStrength_lessna)

## 3) Create a dataframe that summarizes the mean of 3 variables: DASS_anxiety, DASS_depression, and DASS_stress,
##    split by the Gender of the participants.

## If you are writing a function, then it should work on a range of input dataframes and
## input grouping variable (in this case, it's Gender)

summarize_mean <- function(df, group, variables){
  unique_groupings <- sort(unique(df[[group]]))
  summary_table <- as.data.frame(matrix(nrow = length(unique_groupings),ncol = length(variables)))
  colnames(summary_table) <- variables
  rownames(summary_table) <- unique_groupings
  for(i in 1:length(unique_groupings)){
    for(j in 1:length(variables)){
      summary_table[i,j] <- mean(unlist(df[df[[group]] == unique_groupings[i], variables[j]]) ,na.rm=T)
    }    
  }
  return(summary_table)
}
summarize_mean(CovidStrength, "Gender", c("DASS_anxiety", "DASS_depression", "DASS_stress"))

## 4) Compute a new variable in CovidStrength that is the mean of DASS_anxiety split by gender.

## If you are writing a function, then it should work on a range of input dataframes and
## input grouping variable (in this case, it's Gender)

group_mean <- function(df, group, variable){
  unique_groupings <- sort(unique(df[[group]]))
  output <- rep(NA, nrow(df))
  for(i in 1:length(unique_groupings)){
    group_index <- which(df[[group]] == unique_groupings[i])
    group_data <- df[[variable]][group_index]
    output[group_index] <- mean(group_data,na.rm=T)
  }
  return(output)
}
CovidStrength$DASS_anxiety_gendermean <-  group_mean(CovidStrength, "Gender", "DASS_anxiety")
CovidStrength$DASS_anxiety_gendermean

## 5) Create a dataframe that summarizes the pearson correlations of Creativity with 3 variables (itself, Forgiveness, Gratitude).
##    split by Gender.
##    Hint: you can use the cor() function to compute correlations.

## If you are writing a function, then it should work on a range of input dataframes,
## input grouping variable (in this case, it's Gender), and input outcome variable (in this case, it's Creativity).

group_cor <- function(df, group, outcome, use = "complete.obs"){
  if(!outcome %in% colnames(df)){
    warning("Outcome variable not in df. Returning NULL")
    return(NULL)
  }
  unique_groupings <- sort(unique(df[[group]]))
  output <- as.data.frame(matrix(nrow = length(unique_groupings), ncol = ncol(df)-1))
  rownames(output) <- unique_groupings
  colnames(output) <- colnames(df)[colnames(df)!=group]
  for(i in unique_groupings){
    group_df <- df[df[[group]] == i, ]
    cor_table <- cor(group_df[,colnames(output)], use = use)
    output[i, ] <- cor_table[outcome, colnames(output)]
  }
  print(paste("Correlations with", outcome))
  return(output)
}
group_cor(df = CovidStrength[,c("Creativity", "Forgiveness", "Gratitude", "Gender")], group = "Gender", outcome = "Creativity")
