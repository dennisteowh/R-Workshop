library(ggplot2)
library(tidyverse)
# Load Sample Data Set
setwd("C:/Users/user/Dropbox/NCSS/R Workshop")
CovidStrength <- read_csv("Data/CovidStrength.csv")

# Basic Structure of a ggplot call - aesthetics and geometries
ggplot(CovidStrength, aes(x = Openness, y = Creativity))

ggplot(CovidStrength, aes(x = Openness, y = Creativity)) +
  geom_point()

ggplot(CovidStrength, aes(x = Openness, y = Creativity)) +
  geom_point(size = 2, color = "red")

ggplot(CovidStrength, aes(x = Openness, y = Creativity)) +
  geom_point()+
  geom_smooth(method = "loess", color = "red") +
  geom_smooth(method = "lm", color = "blue")

# grouping; color; shape; fill
ggplot(CovidStrength, aes(x = Openness, y = Creativity, color = Gender)) +
  geom_point()

ggplot(CovidStrength, aes(x = Openness, y = Creativity, shape = Gender, color = Gender)) +
  geom_point()

# faceting
CovidStrength %>%
  filter(!is.na(Gender)) %>%
  ggplot(aes(x = Openness, y = Creativity)) +
  geom_point() +
  facet_grid(.~Gender)

CovidStrength %>%
  filter(!is.na(Gender)) %>%
  ggplot(aes(x = Openness, y = Creativity)) +
  geom_point() +
  facet_grid(Gender~.)

# No Exercise for this Session :)

# https://bookdown.org/yih_huynh/Guide-to-R-Book/introduction-to-graphing.html


# Concluding Remarks for Course: ------------

# What I focused on (or at least tried to):
## How to solve problems using basic programming (today's session not inclusive!)

# What I did not cover: 
## Writing Clean and Readable Code
## Efficient Programming (Space and Time Complexity)
## Working with character data
## Data Cleaning Workflow and Best Practices

# What you can do from here on (if you wish to continue learning R): 
## Rely on Tidyverse and the helpful R community! (Google still works 90% of the time!)
## Struggle with the basics until you are comfortable... (https://bookdown.org/ndphillips/YaRrr/)


