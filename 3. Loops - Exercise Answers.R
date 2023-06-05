# Exercise: Use R to get the answers to the questions below (Don't just type the answer...)
#           You are encouraged to use loops as far as possible to solve each question
#           That said, it is also good to think of other ways to solve each question (without loops)
#           This will help you to see how there are often loops "hidden" behind the other functions we use

# Rules: You can only use functions that are within the "Allowable Functions List.pdf"

# NOTE: For pedagogical purposes, i also included an alternative solution that solves each question using vector manipulations (session 1)
#       (except question 1; that cannot be solved using only vector manipulations)
#       Again, the point is to show that there is often a loop (or two!) within many operations we perform in R
#       While the vector solution (aka vectorization) is generally recommended (it's a faster and less clunky code),
#       loops are THE MOST FLEXIBLE tool in the programmer's toolkit so it pays to learn it well.

## 1) Create a vector, called "fibo", assigning it with the values, c(0,1). If you add these 2 numbers and extend the vector, we
##    get c(0,1,1). This process of adding the last 2 numbers of the vector and extending it can be repeated indefinitely (next in the sequence would be c(0,1,1,2) ).
##    Repeat this process (starting from c(0,1)) 20 times.

fibo <- c(0,1)
for (i in 1:20){
  fibo <- c(fibo, (fibo[length(fibo)-1] + fibo[length(fibo)]))
}
fibo

## 2) Using your answer from 1), create another vector which divides each number by the preceding number (ignore the first number)
##    Name your vector "fibo_ratio".

fibo_ratio <- c()
for (i in 2:length(fibo)){
  fibo_ratio <- c(fibo_ratio, (fibo[i]/fibo[i-1]))
}
fibo_ratio

## vector solution
fibo_ratio_vect <- fibo[2:length(fibo)]/fibo[1:(length(fibo)-1)] # take note of the brackets!
fibo_ratio_vect

all(fibo_ratio == fibo_ratio_vect) # checks if all elements are the same
 
## 3) The golden ratio is approximately 1.61803398875.
##    Check each number in fibo_ratio to see if it is within .001 difference of the golden ratio.
##    Store your answers in a new vector called "golden_ratio_bool" (this should be a logical vector with TRUE and FALSE).

golden_ratio_bool <- rep(F, length(fibo_ratio))
golden_ratio <- 1.61803398875

for(i in 1:length(fibo_ratio)){
  if((fibo_ratio[i] < (golden_ratio + .001)) & (fibo_ratio[i] > (golden_ratio - .001))){
    golden_ratio_bool[i] <- T
  }
}
golden_ratio_bool

## vector solution
golden_ratio_bool_vect <- rep(F, length(fibo_ratio_vect))
golden_ratio <- 1.61803398875
golden_ratio_bool_vect[fibo_ratio_vect < (golden_ratio + .001) & fibo_ratio_vect > (golden_ratio - .001)] <- T
golden_ratio_bool_vect

all(golden_ratio_bool == golden_ratio_bool_vect) # checks if all elements are the same

## 4) Compute the sum of the even numbers in fibo.
##    hint: use the %% operator; this computes the remainder after a division
##    e.g., 5%%2 = 1 since you have a remainder of 1 after dividing 5 by 2

fibo_even_sum <- 0
for(i in fibo){
  if(i %% 2 == 0){
    fibo_even_sum <- fibo_even_sum + i
  }
}
fibo_even_sum

## vector solution
fibo_even_sum_vect <- sum(fibo[fibo %% 2 == 0])
fibo_even_sum_vect
fibo_even_sum_vect == fibo_even_sum

## 5) Compute the sum of the odd numbers in fibo. 
##    hint: use the %% operator; this computes the remainder after a division
##    e.g., 5%%2 = 1 since you have a remainder of 1 after dividing 5 by 2

fibo_odd_sum <- 0
for(i in fibo){
  if(i %% 2 != 0){
    fibo_odd_sum <- fibo_odd_sum + i
  }
}
fibo_odd_sum

## vector solution
fibo_odd_sum_vect <- sum(fibo[fibo %% 2 != 0])
fibo_odd_sum_vect
fibo_odd_sum_vect == fibo_odd_sum

## 6) Create a vector, called "fibo_reversed", which contains the values of fibo in reverse order. 

fibo_reverse <- c()
for(i in length(fibo):1){
  fibo_reverse <- c(fibo_reverse, fibo[i]) 
}
fibo_reverse

## vector solution
fibo_reverse_vect <- fibo[length(fibo):1]
fibo_reverse_vect

all(fibo_reverse_vect == fibo_reverse) # checks if all elements are the same

## 7) Compute the square of fibo, and call the resulting vector "fibo_square".

fibo_square <- rep(NA, length(fibo))
for(i in 1:length(fibo)){
  fibo_square[i] <- fibo[i]^2
}
fibo_square

## vector solution
fibo_square_vect <- fibo^2
fibo_square_vect

all(fibo_square_vect == fibo_square) # checks if all elements are the same

## 8) For each number in fibo, check if it can be reproduced by summing 2 sequential numbers (can be any 2 sequential numbers) in fibo_square
##    (e.g., 5, which is the 6th fibo number can be reproduced by summing 1 and 4 from fibo_square).

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

## vector solution
fibo_square_sum_vect <- fibo_square_vect[1:(length(fibo_square_vect)-1)] + fibo_square_vect[2:length(fibo_square_vect)] # take note of the brackets!
fibo_square_sum_vect

all(fibo_square_sum == fibo_square_sum_vect)

fibo_check_vect <- fibo %in% fibo_square_sum_vect

all(fibo_check_vect == fibo_check) # checks if all elements are the same
