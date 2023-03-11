#Chapter 1: Getting started, installing packages and bringing them to the current R session
getwd()
install.packages(c("tidyverse", 
                   "dplyr", 
                   "tidyr", 
                   "haven", 
                   "sjlabelled", 
                   "gt", 
                   "gtsummary", 
                   "hexbin",
                   "ggplot2"))
library(tidyverse)
library(dplyr)
library(tidyr)
library(haven)
library(sjlabelled)
library(gt)
library(gtsummary)
library(hexbin)
library(ggplot2)

#Chapter 1: Homework

# (1) Create a character vector called "subj" that includes 5 first names.

subj <- c("subj1", "subj2", "subj3", "subj4", "subj5")
typeof(subj)
class(subj)

# (2) Create a numeric vector called "age" that includes the hypothetical ages of those subjects, ranging from 18 to 60 years old. 
# Let 1 of the 5 values be missing.

age <- c(20, 30, 40, 50, NA)
typeof(age)
class(age)
age[length(age)]

# (3) Print both the subj and age vectors to the console. Then, calculate the
# mean and standard deviation of the age vector, removing missing values.

print(subj)
print(age)

mean(age, na.rm = TRUE)
sd(age, na.rm = TRUE)

# (4) Subset the age vector to only return ages greater than 30 years old

age > 30
age[age > 30]

# (5) Subset the "subj" vector to return the names of those with ages greater than 30 years old 

subj[age > 30]

# (6) Concatenate a string that states the names and ages of the SUBJ and AGE 
# vectors. Store this result as "SUBJ_AGE".

SUBJ_AGE <- paste(subj,age, collapse = ", ")
SUBJ_AGE
args(paste)

# (7) What is the class of the vector SUBJ_AGE?

paste("The class of the SUBJ_AGE vector is","'",class(SUBJ_AGE),"'")

# (8) Concatenate the following string together to form a # sentence: 

#"An important subset of my study has L subjects, 
# with a mean age of G years old. 
# Their names and ages are: SUBJ_AGE." 

# L is the number of elements in vector SUBJ, 
# G is the mean age rounded to 2 decimal points, and

L <- length(subj)
G <- round(mean(age, na.rm = T),2)

paste("An important subset of my study has", L, "subjects, with a mean age of",
G, "years old. Their names and ages are:", SUBJ_AGE)
