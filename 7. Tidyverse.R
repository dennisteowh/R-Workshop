# Installing and Loading Packages
library(tidyverse)
library(readr)

# Load Sample Data Set
setwd("C:/Users/user/Dropbox/NCSS/R Workshop")
CovidStrength <- read_csv("Data/CovidStrength.csv")

# Basic Tidyverse Functions ------

## filter
filter(CovidStrength, Age > 30)

## select
select(CovidStrength, Age)
select(CovidStrength, Age, Openness)

## %>%
CovidStrength %>%
  filter(Age > 30)

CovidStrength %>%
  filter(Age > 30) %>%
  select(Age, Openness)

## group_by and summarize
CovidStrength %>%
  summarize(Openness_Mean = mean(Openness, na.rm = T))

CovidStrength %>%
  group_by(Gender) %>%
  summarize(Openness_Mean = mean(Openness, na.rm = T))

CovidStrength %>%
  filter(!is.na(Gender)) %>%
  group_by(Gender) %>%
  summarize(Openness_Mean = mean(Openness, na.rm = T))
 
## mutate
CovidStrength <- CovidStrength %>%
  mutate(Openness_Mean = mean(Openness, na.rm = T))

CovidStrength %>%
  select(Openness_Mean)

CovidStrength <- CovidStrength %>%
  group_by(Gender) %>%
  mutate(Openness_Mean = mean(Openness, na.rm = T)) %>%
  ungroup()

CovidStrength %>%
  select(Openness_Mean)

# Joins -----
CovidStrengthMini <- CovidStrength %>%
  filter(Participant %in% 1:3) %>%
  select(1:5)

CovidStrengthMini

ParticipantHeight <- data.frame(
  Participant = 2:6,
  Height = c(170:174)
)

## left_join
CovidStrengthMini %>%
  left_join(ParticipantHeight)

ParticipantHeight %>%
  left_join(CovidStrengthMini)

## full_join
CovidStrengthMini %>%
  full_join(ParticipantHeight)

# Pivot -----

wide_data <- data.frame(
  Participant = 1:5,
  Introversion_t1 = rnorm(5),
  Introversion_t2 = rnorm(5),
  Introversion_t3 = rnorm(5)
)
wide_data

long_data <- data.frame(
  Participant = rep(1:5,3),
  Time = rep(1:3, 5),
  Introversion = rnorm(15)
)
long_data

## pivot_wider
long_data %>%
  pivot_wider(id_cols = Participant,
              names_from = Time,
              names_prefix = "Introversion_t",
              values_from = Introversion
              )

## pivot_longer
wide_data %>%
  pivot_longer(cols = Introversion_t1:Introversion_t3,
               names_to = "Time",
               values_to = "Introversion"
               )

# No Exercise for this Session :)

## https://bookdown.org/yih_huynh/Guide-to-R-Book/tidyverse.html
