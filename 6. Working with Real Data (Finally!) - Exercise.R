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



## 2) Remove the variables in CovidStrength with more than 30% of missing data.

## If you are writing a function, it should be able to work on a range of input dataframes.
## Ideally, you can also specify the threshold of missingness (in this case 30%) where you would remove the variable.



## 3) Create a dataframe that summarizes the mean of 3 variables: DASS_anxiety, DASS_depression, and DASS_stress,
##    split by the Gender of the participants.

## If you are writing a function, then it should work on a range of input dataframes and
## input grouping variable (in this case, it's Gender)


## 4) Compute a new variable in CovidStrength that is the mean of DASS_anxiety split by gender.

## If you are writing a function, then it should work on a range of input dataframes and
## input grouping variable (in this case, it's Gender)


## 5) Create a dataframe that summarizes the pearson correlations of Creativity with 3 variables (itself, Forgiveness, Gratitude).
##    split by Gender.
##    Hint: you can use the cor() function to compute correlations.

## If you are writing a function, then it should work on a range of input dataframes,
## input grouping variable (in this case, it's Gender), and input outcome variable (in this case, it's Creativity).

