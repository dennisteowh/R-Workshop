animals <- c("Mufasa", "Simba", "Timon", "Pumbaa", "Nala")
weight <- c(40, 20, 3, 1000, 19)
species <- c("lion", "lion", "meerket", "warthog", "lion")

# 1) Which animals weigh less than 20kg?
animals[weight < 20]

# 2) How many animals weigh less than 20kg?
length(animals[weight < 20])
sum(weight < 20)

# 3) Does Mufasa weigh less than 20kg?
"Mufasa" %in% animals[weight < 20]
weight[animals == "Mufasa"] < 20

# 4) Which lions weigh more than or equal to 20kg?
animals[weight >= 20 & species == "lion"]

# 5) Sort the animals in your vectors in alphabetical order (just print the answer out, no need to modify the original animals vector)
sort(animals)
animals[order(animals)]

# 6) Sort the animals according to their weight (in descending order; just print the answer out, no need to modify the original animals vector)
animals[order(weight)]

# 7) What is the last animal (ordered alphabetically)?
sort(animals)[length(animals)]
sort(animals, decreasing = T)[1]

# 8) Does the last animal (ordered alphabetically) weigh exactly 3 kg?
weight[order(animals)][length(weight)] == 3

# 9) Add another animal called "Zazu" to the animals vector and 
#    add another weight of 1.2 (corresponding to Zazu's weight) to the weight vector 
#    add another species of "hornbill" (corresponding to Zazu's species) to the species vector
animals[length(animals)+1] <- "Zazu"
weight[length(weight)+1] <- 1.2
species[length(species)+1] <- "hornbill"

# 10) Rerun your code from the previous questions. Do they still give the correct answers?
