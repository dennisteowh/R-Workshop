# Exercise: Create your very own DIY series!
#           For each function below, write your own version of it!
#           It doesn't have to match the original function perfectly 
#           But you know... it should still do the job... don't write a useless function...
#           For any function you are unfamiliar with, use the ? to access the help console! (e.g., ?length)

# Rules: You can only use functions that are within the "Allowable Functions List.pdf". Actually...no...
#        Use ONLY THE FUNCTIONS BEFORE "Other Useful Primitives" (or until "Programmers' Workhorses")!!! 
#        We are creating a DIY series of many of the useful (but strictly non-essential) functions on this list!
#        So of course, you are not allowed to use them when creating your own version!

# 1) length
length_diy <- function(x){
  count <- 0
  for (i in x){
    count <- count + 1
  }
  return(count)
}

length_diy(c(1,2,3))

# 2) mean
mean_diy <- function(x, na.rm=F){
  if(na.rm==F){
    return(sum(x)/length_diy(x)) # recall that we already learned how to write a sum function in the session
  }else if(na.rm == T){
    return(sum(x,na.rm=T)/length_diy(x[!is.na(x)]))
  }
}
mean_diy(c(1,2,3))
mean_diy(c(1,2,3,NA))
mean_diy(c(1,2,3,NA), na.rm=T)

# 3) rowMeans; ignore dims argument
rowMeans_diy <- function(df, na.rm = F){
  track_means <- c()
  for(i in 1:nrow(df)){
    row_vect <- unlist(df[i,])
    track_means[i] <- mean_diy(row_vect, na.rm = na.rm)
  }
  return(track_means)
}

df <- data.frame(
  a = 1:3,
  b = 2:4, 
  c = c(3,4,NA)
)
rowMeans_diy(df)
rowMeans_diy(df, na.rm = T)

# 4) min
min_diy <- function(x, na.rm=FALSE){
  if(na.rm == TRUE){
    x <- x[!is.na(x)]
  }
  minimum <- x[1]
  for(i in 2:length(x)){
    if(x[i] < minimum){
      minimum <- x[i]
    }
  }
  return(minimum)
}

min_diy(c(42,2,7))
min_diy(c(42,2,7,NA))
min_diy(c(42,2,7,NA),na.rm=T)

# 5) unique
unique_diy <- function(x){
  track_unique <- c(x[1])
  for (i in 2:length(x)){
    if(! x[i] %in% track_unique){
      track_unique <- c(track_unique, x[i])
    }
  }
  return(track_unique)
}

unique_diy(c(1,2,2,2,3,4))

# 6) which
which_diy <- function(x){
  if(!is.logical(x)){
    print("ERROR: input is not logical")
  }
  output <- c()
  for(i in 1:length(x)){
    if(x==TRUE){
      output <- c(output, i)
    }
  }
}
test <- 5:10
which(test < 7)

# 7) seq (no need length.out or along.with arguments)
seq_diy <- function(from, to, by=1){
  
  floor_diy <- function(x){
    if(x < round(x)){ # if rounded up
      return(round(x)-1)
    }else{
      return(round(x))
    }
  }
  
  seq_length <- floor_diy((to - from)/by) + 1
  output <- from + (0:(seq_length-1))*by
  return(output)
}

seq_diy(1,5)

# 8) na.omit
na.omit_diy <- function(df){
  rows_to_keep <- c()
  for(i in 1:nrow(df)){
    row_to_check <- as.vector(unlist(df[i, ])) 
    # note: as.vector(unlist()) is not needed here but useful when managing real data (more on that in session 5)
    if(!NA %in% row_to_check){
      rows_to_keep <- c(rows_to_keep, i)
    }
  }
  return(df[rows_to_keep,])
}

test_df <- data.frame(
  a = 1:5,
  b = c(5:7, NA, NA),
  c = c(NA, 3:6)
)

test_df
na.omit_diy(test_df)


# Bonus Challenge! - Merging Categorical Variables

## This is a common cleaning problem when dealing with categorical variables. 
## Consider the data set, gender_df. It contains the self-reported gender status of 6 participants.
## However, the gender status is split across 3 columns, "male", "female", and "other".
## 1 means that "Yes", 0 means "No", and NA means missing data.
## To perform analysis, we typically need gender to be a single column.
## Write a function to solve this problem (remember your function should be generalizable to other similar problems).

gender_df <- data.frame(
  sn = 1:6,
  male = c(1,0,0,0,0,NA),
  female = c(0,1,1,0,0,NA),
  other = c(0,0,0,1,1,NA)
)


merge_variables <- function(df, values = colnames(df)){
  output <- rep(NA, nrow(df))
  for(i in 1:ncol(df)){
    variable <- df[[i]] # see what happens if you run df$i instead
    output[variable == 1] <- values[i]
  }
  return(output)
} # what about conflicts; what if original values were not coded 1s and 0s?

merge_variables(gender_df)




# Bonus Challenge! - List of Drug Use

## This is an actual problem I encountered here in TSRD and I found the solution useful across a range of problems.
## Here is a drug use data set containing 6 participants.
## 1 means that the drug was used, 0 means that the drug was not used, and NA means missing data
## The problem is to compute a list of drug use for each participant (e.g., sn #2 used "ice, heroin, caannabis"). 
## Note that the end goal is to compute a frequency count for each drug use combination (you don't have to do this for the question)
## So make sure the list is standardized to have the same order for similar combinations
## e.g., participant X used "ice, cannabis" and participant Y used "cannabis, ice" is not good.
## Write a function to solve this problem.
## See that the function can be extended to solve other problems of similar structure (e.g., list of interventions, list of institutions...)

## Hint: you might find the paste function useful here

drug_df <- data.frame(
  sn=1:6,
  ice = c(1,1,0,0,1,NA),
  heroin = c(0,1,1,0,0,NA),
  cannabis = c(0,1,0,1,1,NA),
  ecstacy = c(0,0,0,0,1,NA)
)


list_combinations <- function(df, values = colnames(df)){
  output <- rep(NA, nrow(df))
  for(i in 1:nrow(df)){
    df_row <- as.vector(unlist(df[i,]))
    if(all(is.na(df_row))){
      output[i] <- NA
      next
    }
    output[i] <- paste(values[df_row == 1], collapse = " ")
  }
  return(output)
} # what if original values were not coded 1s and 0s?

list_combinations(drug_df[,-1])


# Bonus Challenge! - Frequency Bins!

## Have you ever wondered how the bins in histograms are computed? No? Oh well.. 
## A histogram takes in a list of numbers (you can try it with the hist() function)
## and partitions those numbers into several bins.
## It then counts the number of values in each bin and displays that in the form of a chart!
## For example, try hist(0:100, breaks = 5) 
## The function tries to ensure that the bins are equal (although this cannot always be ensured)
## In this case, the function partitioned 0 to 100 into 5 bins, each of width 20 (with the first bin having a width of 21)
## For each bin, the graph shows the frequency counts within the bin's width/range.
## In this case, there's 20 counts in the last 4 bins and 21 counts in the first bin.

## Let's write a function to do something similar!
## However, we only want the frequency table that reports the frequency counts within each bin range (no need to plot it out; we haven't learnt that...)
## Again, the function does not have to perfectly match the computations behind the hist() function (as long as you can partition and count, that's good enough!)
## For decent utility, however, we want at least 2 additional arguments
## 1) bins - the user should be able to specify the number of bins 
## 2) bin width - the user should be able to specify the size of the bins
## Note that specifying either one of these arguments is sufficient to generate the frequency table
## However, we never know when the user would find it more useful to specify the number of bins or the size of the bin width.


frequency_bins <- function(x, bins=NULL, bin_width = NULL){
  if(is.null(bins)&is.null(bin_width)){
    warning("No inputs for either bins and bin_width. Setting bins = 10")
    bins = 10
  }
  if(!is.null(bins) & !is.null(bin_width)){
    warning("Cannot have inputs in both bins and bin_width. Ignoring input for bin_width")
    # warning is just a special kind of print (color codes the output to look like a warning)
    # another similar type of function is the message() function
  }
  min_x <- min(x, na.rm = T)
  max_x <- max(x, na.rm = T)
  if(!is.null(bins)){
    bin_width <- (max_x - min_x)/bins
  }
  bin_intervals <- seq(min_x, max_x, bin_width) # note that tail values tend to be cut off
  bin_starts <- bin_intervals[-length(bin_intervals)]
  bin_ends <- bin_intervals[-1]
  output <- data.frame(matrix(nrow=length(bin_starts), ncol=3))
  colnames(output) <- c("Start", "End", "Frequency")
  output[["Start"]] <- bin_starts
  output[["End"]] <- bin_ends
  for(i in 1:nrow(output)){
    output[i, "Frequency"] <- sum(x>=bin_starts[i] & x<bin_ends[i],na.rm=T)
  }
  return(output)
}

frequency_bins(1:100, bins = 10)
frequency_bins(1:100, bin_width = 10)
frequency_bins(1:100)
frequency_bins(1:100, bins = 10 , bin_width = 10)
