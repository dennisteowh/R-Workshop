# Exercise 

# Rules: You can only use functions that are within the "Allowable Functions List.pdf"

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

## 1) Which pokemon has an attack lower than 50 and defense greater than 45?



## 2) Create a new dataset called "pokemon_ordered_data" that orders the rows in the order of the pokedex entry



## 3) Which pokemon has the second highest speed?



## 4) What are the row numbers of the pokemon that have a higher attack stat compared to their respective defense stat?



## 5) The stats for magikarp is wrong. It should be hp = 20, attack = 10, defense = 55, sp_atk = 15, sp_def = 20, speed = 80. Please correct it.



## 6) Rerun your code with the updated dataset (after correcting magikarp stats). Are your answers still correct?



## 7) Create a new variable in the dataset called "Attack_Mean" which is the mean of each pokemon's attack and sp_atk stats. 



## 8) I am annoyed by the Attack_Mean column name as it should be small letters like the rest of the column names. Please change it thanks. 



## 9) Create a new variable in the dataset called "highest_stat". It should record the highest stat of each pokemon
##    (e.g., attack, defense). If there is a tie, pick the first one (in alphabetical order; alternatively you can
##    challenge yourself to include all the highest stats which frankly makes more sense).
##    hint: you might find the max() function and colnames() function useful
##    hint: if you take on the harder challenge, you might find the paste() function useful



## 10) It is interesting to see how these pokemon would fare against each other if they battled (assume they can battle themselves too; or a clone of themselves)
##    Create a new dataframe (I initialized a dataframe for you to kick things off) to capture the damage outputs for each pair of pokemon
##    To calculate the damage, you need to consider if the attacker used a physical attack or a special attack
##    If a physical attack was used, the damage taken by the defender would be {attack - defense}. 
##    If this score is negative, then the damage taken is 0.
##    If a special attack was used, the damage taken by the defender would be {sp_atk - sp_def}
##    Disclaimer: This is not actually how the damage is calculated in the games!

damage_chart <- data.frame(matrix(nrow = nrow(pokemon_data)^2, ncol = 4))
colnames(damage_chart) <- c("Attacker", "Defender", "Physical Attack Damage", "Special Attack Damage")


## Bonus Challenge! - Crowning the Champion!
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

