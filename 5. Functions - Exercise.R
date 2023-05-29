# Exercise: Create your very own DIY series!
#           For each function below, write your own version of it!
#           It doesn't have to match the original function perfectly 
#           But you know... it should still do the job... don't write a useless function...
#           For any function you are unfamiliar with, use the ? to access the help console! (e.g., ?length)

# Rules: You can only use functions that are within the "Allowable Functions List.pdf". Actually...no...
#        Use ONLY THE FUNCTIONS BEFORE "Other Useful Primitives" (or until "Programmers' Workhorses")!!! 
#        We are creating a DIY series of many of the useful (but strictly non-essential) functions on this list!
#        So of course, you are not allowed to use them when creating your own version!


# 1) length()


# 2) mean()


# 3) rowMeans(); you can ignore dims argument


# 4) min()


# 5) unique()


# 6) which()


# 7) seq(); you can ignore the length.out and along.with arguments


# 8) na.omit()




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

hist(0:100, breaks = 5) 