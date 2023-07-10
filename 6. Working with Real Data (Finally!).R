# Getting the package...
library(readr)

# Importing Data and Working Directory
setwd("C:/Users/user/Dropbox/NCSS/R Workshop")
CovidStrength <- read_csv("Data/CovidStrength.csv")

# https://www.kaggle.com/datasets/mathchi/covid19-and-character-strengths

# Class Differences in Loaded Data

avengers <- data.frame(
  marvel_heroes = c("thor", "captain america", "ironman", "hulk", "black widow", "hawkeye"),
  name = c("thor", "steve rogers", "tony stark", "bruce banner", "natasha romanoff", "who even remembers this"),
  weapon = c("mjolnir", "shield", "suit", "hulk goes smash!", "legs?", "bow"),
  age = c("1500", "99", "50", "49", "39", "41")
)

class(CovidStrength)
class(avengers)

CovidStrength[,1]
avengers[,1]

CovidStrength[[1]]
CovidStrength[["Participant"]]
CovidStrength$Participant

unlist(CovidStrength[, 1])
as.vector(unlist(CovidStrength[, 1]))

# Missing Values
is.na(CovidStrength)

# Testing your code and creating toy data sets


# Factor Variables
class(CovidStrength$Gender)
?factor

factor(CovidStrength$Gender)
factor(CovidStrength$Gender, levels = c("Male", "Female"))
factor(CovidStrength$Gender, levels = c("Male", "Female"), labels = c("M", "F"))

# Some notes on merging and wrangling dataframes

set.seed(100)
long_data <- data.frame(
  id = c(1,1,1,2,2,2,3,3,3),
  time = c(1,2,3,1,2,3,1,2,3),
  variable = rnorm(9)
)
age_data <- data.frame(
  id = c(1,2,3),
  age = c(25,73,35)
)

## left_join

### identify keys
### identify columns that don't match
### loop through matching keys, inserting variables from columns that don't match (right into left) 

## pivot_wider

### unstacking by key
### bind unstacked columns together

## pivot_longer

### break apart by columns (keeping key in each break)
### stack columns 


# Some notes on working with statistical outputs (higher level objects)

CovidStrength$Gender_Factor <-  factor(CovidStrength$Gender, levels = c("Male", "Female"))
summary(lm(DASS_stress ~ Day + Gender_Factor, CovidStrength))

lm_object <- lm(DASS_stress ~ Day + Gender_Factor, CovidStrength)
lm_summary <- summary(lm(DASS_stress ~ Day + Gender_Factor, CovidStrength))
lm_object$coefficients
lm_summary$coefficients