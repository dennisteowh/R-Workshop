
# Sheep Counting 



# Basic For Loop (initialize then iterate)



# What is i? 



# Iterate over what?



# Loops + Conditional Statements (back to sheep example)

set.seed(100)

sheep_herd <- sample(c("white sheep", "black sheep", "bald sheep", "horse"), 100, replace = T)

## Back to Fisherman example (for practice). Recall:
## To be a responsible and sustainable fisherman, one ought to follow some basic fishing guidelines:
## a) Endangered species should be returned immediately to the Ocean
## b) You can take a fish home if it is at least 183 cm in length

## Following these rules, you fished for 100 days straight, and caught 1 fish per day (cause you know.. 
## you are a highly skilled fisherman...). The two vectors, fish_species and fish_length records
## the species (Endangered vs Not Endangered) and length (in cm) for each of your catches respectively. 
## Find out how many fish were "returned to sea" and how many fish were "put in my belly".

set.seed(100)

fish_species <- sample(c("Endangered", "Not Endangered"), 100, replace = T)
fish_length <- sample(100:300, 100, replace = T)


# rep() for initialization (simple numbers example)

set.seed(100)

random_numbers <- sample(1:50, 20, replace = F)

# Break and Next


# nested loops (we will see this more when covering Dataframes)


# While loops (if have time)


#---GO TO EXERCISE---#
