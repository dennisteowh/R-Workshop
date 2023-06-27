## Allowable function list

## Conceptual and Syntactical level

## Top-down (breaking down a problem) and Bottom-up approach (working up from simple examples)

## Loops Qn 1) Create a vector, called "fibo", assigning it with the values, c(0,1). If you add these 2 numbers and extend the vector, we
##    get c(0,1,1). This process of adding the last 2 numbers of the vector and extending it can be repeated indefinitely (next in the sequence would be c(0,1,1,2) ).
##    Repeat this process (starting from c(0,1)) 20 times.



## Loops Qn 8) For each number in fibo, check if it can be reproduced by summing 2 sequential numbers (can be any 2 sequential numbers) in fibo_square (the square of fibo)
##    (e.g., 5, which is the 6th fibo number can be reproduced by summing 1 and 4 from fibo_square).



# Loops Bonus Challenge! - Coding the Likert Scale

## Below, we have the survey responses of 3 participants. 
## We want to analyze their data but unfortunately, R cannot perform computations on character vectors
## Convert each of the subjects' responses to numbers based on the following coding frame:
## Strongly Agree - 5
## Agree - 4 
## Neutral - 3
## Disagree - 2
## Strongly Disagree - 1
## NA - NA

## There are many ways to solve this problem but!
## A good programmer would be able to reuse the same code to convert all 3 sets of responses
## (Imagine if you had 100 participants, it would be tedious to solve each case individually...)

subject1 <- c("Agree", "Strongly Agree", "Disagree", "Disagree", "Agree")
subject2 <- c("Strongly Disagree", "Strongly Agree", "Strongly Agree", "Strongly Agree", "Neutral")
subject3 <- c("Neutral", "Neutral", "Neutral", "Neutral", NA)



# Loops Bonus Challenge! - The Scammer's Jicksaw Puzzle

## You are working with a dubious health product company who targets vulnerable overweight people.
## Your company managed to find a few potential targets by sourcing BMI records (through suspicious activities).
## As a professional in your craft, you believe more can be done to increase the company's profits.
## With better knowledge of the targets' (aka chumps) medical history, it would be all too easy to hook them into buying more products.
## So, you hacked into a local hospital's admin records.
## However, you quickly realized that these records contained no identifiers.
## You brilliantly thought that you might be able to link the records by matching the BMI of the chumps with the hospital records.
## However... the medical records only contained the patients' weight information...
## You managed to independently source the height records (apparently it was a slip up from one of the hospital staff...).
## BUT... the height records had no identifiers and are most likely jumbled up...

## Here, we have the data from the shady company's targets (indicated by chump_)
## as well as the records from the hospital (indicated by patient_; note that the height information is mixed up).

## Locate the medical records (if possible) of the chumps (please do not try this at home!!; okay... try the exercise at home but don't help scam businesses!)
## FYI, BMI = Weight/Height^2
## Tip: Trying to match the BMI records is quite tricky because the precision of chump_bmi is only up to 2 decimal places
## You can use the round() function to correct this issue (e.g., round(100.0132) will leave the output in 2 decimal places -> 100.01)

chump_name <- c("Tristin Joseph", "Melanie Hardin", "Alexis Rangel")
chump_bmi <- c(37.12, 40.07, 39.06)

patient_history <- c("High blood pressure (hypertension)",
                     "High LDL cholesterol",
                     "Type 2 diabetes",
                     "Coronary heart disease",
                     "Stroke",
                     "Gallbladder disease",
                     "Osteoarthritis (a breakdown of cartilage and bone within a joint)",
                     "Sleep apnea and breathing problems",
                     "Clinical depression, anxiety, and other mental disorders",
                     "Body pain and difficulty with physical functioning")
patient_weight <- c( 91.48857,  67.1878, 100.70044, 95.0272, 107.8088, 76.1884,  77.24196,  69.06458,  66.7925, 119.6213)
patient_height_scrambled <- c(1.52, 1.60, 1.91, 1.82, 1.75, 1.49, 1.63, 1.65, 1.72, 1.78)


##-----------------------------------------------------------------------------

pokemon_data <- data.frame(
  name = c("charmander", "squirtle", "bulbasaur", "pikachu", "eevee", "magikarp"),
  type = c("fire", "water", "grass/poison", "electric", "normal", "normal"),
  pokedex_entry = c(4, 7, 1, 25, 133, 129),
  hp =     c(39, 44, 45, 35, 55, 999),
  attack = c(52, 48, 49, 55, 55, 999),
  defense =c(43, 65, 49, 40, 50, 999),
  sp_atk = c(60, 50, 65, 50, 45, 999),
  sp_def = c(50, 64, 65, 50, 65, 999),
  speed =  c(65, 43, 45, 90, 55, 999)
)

## 2) Create a new dataset called "pokemon_ordered_data" that orders the rows in the order of the pokedex entry

## 3) Which pokemon has the second highest speed?

## 9) Create a new variable in the dataset called "highest_stat". It should record the highest stat of each pokemon
##    (e.g., attack, defense). If there is a tie, pick the first one (in alphabetical order; alternatively you can
##    challenge yourself to include all the highest stats which frankly makes more sense).
##    hint: you might find the max() function and colnames() function useful
##    hint: if you take on the harder challenge, you might find the paste() function useful

## Dataframes Qn 10) It is interesting to see how these pokemon would fare against each other if they battled (assume they can battle themselves too; or a clone of themselves)
##    Create a new dataframe (I initialized a dataframe for you to kick things off) to capture the damage outputs for each pair of pokemon
##    To calculate the damage, you need to consider if the attacker used a physical attack or a special attack
##    If a physical attack was used, the damage taken by the defender would be {attack - defense}. 
##    If this score is negative, then the damage taken is 0.
##    If a special attack was used, the damage taken by the defender would be {sp_atk - sp_def}
##    Disclaimer: This is not actually how the damage is calculated in the games!

damage_chart <- data.frame(matrix(nrow = nrow(pokemon_data)^2, ncol = 4))
colnames(damage_chart) <- c("Attacker", "Defender", "Physical Attack Damage", "Special Attack Damage")


## Dataframes Bonus Challenge! - Crowning the Champion!
## So, far we managed to get the damage calculations for each pair of pokemon assuming they attack each other once
## However, this alone is not enough to find out the best pokemon in the batch!
## To do this, 3 more things should be considered (i am ignoring pokemon types as that would make things more complicated; but feel free to include them if you are up for it!)
## 1) Battle decisions. The pokemon could choose either a physical or special attack.
## 2) The HP of the pokemon matters. A pokemon with high HP can last longer even if the opposing pokemon can deal more damage.
## 3) The speed of the pokemon matters. A faster pokemon would tend to attack first. In a close battle, the faster pokemon can grasp the win by KOing the opponent before it attacks.

## With these in mind, find out, for each pair of pokemon (this time don't consider the same pokemon fighting itself as we are trying to crown the champ),
## which pokemon would faint first assuming:
## 1) each pokemon take turns to damage each other (faster one always move first)
## 2) the attacking pokemon always chooses the attack that maximizes damage
## 3) the pokemon faints when their HP reaches 0
## The Pokemon Champion is the one that racks up the most (potential) KOs across all possible opponents!

## TIPS: 
## To see which pokemon would faint first, you don't need to painstakingly simulate each battle from start to end (that would be really painful!)
## The problem structure is simplified enough that some simple computations is enough
## On a completely unrelated note (wink), the ceiling() function (a cousin of the round() function) might prove useful
## ceiling() always rounds a number upwards. For example ceiling(1.2) will output the number 2
## Another potentially useful function is the max() function which spits out the highest value given a vector


