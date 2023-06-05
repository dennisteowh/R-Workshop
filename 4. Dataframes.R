# Dataframes

## creating dataframes

famous_figures <- data.frame(
  name = c("obama", "tom cruise", "nemo"),
  occupation = c("president", "actor", "fish"),
  age = c(61, 60, 6)
)

marvel_heroes <- c("thor", "captain america", "ironman", "hulk", "black widow", "hawkeye")
name <- c("thor", "steve rogers", "tony stark", "bruce banner", "natasha romanoff", "who even remembers this")
weapon <- c("mjolnir", "shield", "suit", "hulk goes smash!", "legs?", "bow")
age <- c("1500", "99", "50", "49", "39", "41")

avengers <- data.frame(
  marvel_heroes,
  name,
  weapon,
  age
)

## subsetting dataframes


## different way of subsetting dataframes $


## logical subsetting 


## assigning and coercing in dataframes


## adding new columns 
avengers$gender <- c("M","M","M","M","F","M") #think: how do you delete a column?

## other useful functions
nrow(avengers)
ncol(avengers)
str(avengers)
colnames(avengers) #think: how do you rename column names?
rownames(avengers)

# Conditional Statements and Loops with Dataframes 

set.seed(100)

introversion_data <- data.frame(id = 1:10,
                                introversion1 = sample( 1:5, 10, replace = TRUE),
                                introversion2 = sample( 1:5, 10, replace = TRUE),
                                introversion3 = sample( 1:5, 10, replace = TRUE),
                                introversion4 = sample( 1:5, 10, replace = TRUE),
                                introversion5 = sample( 1:5, 10, replace = TRUE),
                                attention = sample(c(T, F), 10, replace = T))

## composite sum example


## composite sum conditioned on attention check example


## Doing the same thing in vector form 


## Initializing an empty dataframe


#---GO TO EXERCISE---#