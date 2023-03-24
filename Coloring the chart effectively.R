#Importing libraries

library(dplyr)            #for data manupulation
library(ggplot2)          #for data visualization
library(forcats)          #for handling categorical data (factors)

#Creating dataset
head(starwars)            #Using inbuilt dataset from dplyr

df <- filter(starwars, species=="Human") #filtering starwars data for 'Humans'
df[is.na(df$mass), ]      #Checking for missing data in 'mass' variable
data <- df[!is.na(df$mass), ] #Removing missing data from 'mass' variable
data[is.na(data$mass), ]  #Confirming the exclusion of missing data from 'mass'

#creating 'BMI' variable using 'mutate' function in 'dplyr' package

data <- mutate(data, bmi=mass/(height/100)^2)
head(data$bmi)            #Checking the first five observations of 'bmi'

#Setting theme for the plots
theme_set(theme_minimal())

#1 - Base Scatterplot: With 'mass' (weight) on x axis, 'height' on y-axis
base_plot <- ggplot(data, aes(x=mass, y=height)) + 
  geom_point(aes(color=bmi), size=6) + #using 'bmi' variable to color the plot
  labs(title = "1-Base Scatterplot", x="Weight", y="Height") #assigning labels

base_plot                 #Viewing the base plot

#2 - Improved Scatterplot
improved_plot <- ggplot(data, aes(x=mass, y=height)) + 
  geom_point(aes(color=bmi), size=6) +
  scale_color_gradient2(low="green", mid="yellow", midpoint=22, high="red") +
  #Assigning colors to visually identify records respective to bmi
  #low bmi values will be shown in 'green'
  #high bmi values will be shown in 'red'
  #mid-point of bmi is set as 22 and is shown in 'yellow'
  labs(title = "2-Improved Scatterplot", x="Weight (kg)", y="Height (cm)") #assigning labels

improved_plot             #Viewing the base plot

#3 - Let's make it even more impactful for the end user
#3.a Grouping the 'bmi' into meaningful categories 
#Let's use 'cut' function from the 'forcats' package 
#'cut' function is used to create discrete variable from continuous variable
data$bmi_category <- cut(data$bmi, breaks = c(0, 18.5, 25, 30, 35, Inf),
                         labels = c("Underweight", "Normal Weight", "Overweight", "Obese", "Extremely Obese"),
                         right = FALSE)

#Let's create custom color palette for each of the above bmi categories
color_palette <- c("darkblue", "darkgreen", "darkorange", "red", "firebrick")

final_plot <- ggplot(data, aes(x=mass, y=height)) +
  geom_point(aes(color=bmi_category), size=6, alpha=0.5, position = 'jitter') + 
  #now use bmi_category variable to color our plot
  scale_color_manual(values = color_palette, name = "BMI Categories") +
  #assigning our custom color palette 
  labs(title = "3-Final Scatterplot", x="Weight (kg)", y="Height (cm)")
final_plot
