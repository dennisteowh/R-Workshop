
# Exercise

## start with a vector c(0,1). Adding these 2 numbers and extending the vector, we
## get c(0,1,1). Repeat this process of adding the last 2 numbers of the vector and extending it.
## Repeat this process (starting from c(0,1)) 20 times
fibo <- c(0,1)
for (i in 1:20){
  fibo <- c(fibo, (fibo[length(fibo)-1] + fibo[length(fibo)]))
}
fibo

## using your previous answer, create another vector which divides each number by the preceding number (ignore the first number)
fibo_ratio <- c()
for (i in 2:length(fibo)){
  fibo_ratio <- c(fibo_ratio, (fibo[i]/fibo[i-1]))
}
fibo_ratio

## The golden ratio is approximately 1.61803398875.
## Check each number in fibo_ratio to see if it is within .001 difference of the golden ratio
## Store your answers in a new vector called "golden_ratio_bool" 

golden_ratio_bool <- rep(F, length(fibo_ratio))
golden_ratio <- 1.61803398875

for(i in 1:length(fibo_ratio)){
  if((fibo_ratio[i] < (golden_ratio + .001)) & (fibo_ratio[i] > (golden_ratio - .001))){
    golden_ratio_bool[i] <- T
  }
}
golden_ratio_bool

## compute the square of fibo, and call the resulting vector fibo_square
fibo_square <- rep(NA, length(fibo))
for(i in 1:length(fibo)){
  fibo_square[i] <- fibo[i]^2
}
fibo_square
fibo_square <- fibo^2

## for each number in fibo, check if it can be reproduced by summing 2 sequential numbers in fibo_square
## (e.g., 5, which is the 6th fibo number can be reproduced by summing 1 and 4 from fibo_square)
fibo_square_sum <- c()
for(i in 2:length(fibo_square)){
  fibo_square_sum <- c(fibo_square_sum, fibo_square[i] + fibo_square[i-1])
}
fibo_square_sum

fibo_check <- rep(F, length(fibo))
for(i in 1:length(fibo)){
  for(j in fibo_square_sum){
    if(fibo[i] == j){
      fibo_check[i] <- T
    }
  }
}  
fibo_check

# power of vectors
fibo %in% fibo_square_sum

fibo_check == (fibo %in% fibo_square_sum)

# Bonus Challenge! - The Scammer's Jicksaw Puzzle

## You are working with a dubious health products company who targets vulnerable overweight people
## Your company managed to find a few potential targets by sourcing BMI records (through suspicious activities)
## But, as a professional in your craft, you believe more can be done
## With better knowledge of the targets' medical histories, it would be all too easy to hook them into buying more products
## So, you hacked into a local hospital's medical records
## However, you quickly realized that these records contained no identifiers
## You brilliantly discovered that you might be able to link the records by matching the BMI of the targets
## However... the medical records only contained the patients' weight information...
## You managed to independently source the height records (apparently it was a slip up from one of the hospital staff...)
## BUT... the height records had no identifiers and are most likely jumbled up...

## Here, we have the data from the scammer's targets (indicated by target_)
## as well as the records from the hospital (indicated by patient_; note that the height information is jumbled)

## Locate the medical records (if possible) of the targets (please do not try this at home!!; okay... try the exercise at home but don't aid scam businesses!)
## BMI = Weight/Height^2
## Tip: Trying to match the BMI records is partly tricky because the precision of target_bmi is only up to 2 decimal places
## You can use the round() function to correct this issue (e.g., round(100.0132) will leave the output in 2 decimal places -> 100.01)

target_name <- c("Tristin Joseph", "Melanie Hardin", "Alexis Rangel")
target_bmi <- c(37.12, 40.07, 39.06)

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

