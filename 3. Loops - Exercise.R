# Exercise

## 1) Create a vector, called "fibo", assigning it with the values, c(0,1). If you add these 2 numbers and extend the vector, we
##    get c(0,1,1). This process of adding the last 2 numbers of the vector and extending it can be repeated indefinitely (next in the sequence would be c(0,1,1,2) ).
##    Repeat this process (starting from c(0,1)) 20 times.



## 2) Using your answer from 1), create another vector which divides each number by the preceding number (ignore the first number)
##    Name your vector "fibo_ratio".



## 3) The golden ratio is approximately 1.61803398875.
##    Check each number in fibo_ratio to see if it is within .001 difference of the golden ratio.
##    Store your answers in a new vector called "golden_ratio_bool" (this should be a logical vector with TRUE and FALSE).



## 4) Compute the square of fibo, and call the resulting vector "fibo_square".



## 5) For each number in fibo, check if it can be reproduced by summing 2 sequential numbers (can be any 2 sequential numbers) in fibo_square
##    (e.g., 5, which is the 6th fibo number can be reproduced by summing 1 and 4 from fibo_square)



# Bonus Challenge! - The Scammer's Jicksaw Puzzle

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

