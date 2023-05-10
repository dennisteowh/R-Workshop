
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

