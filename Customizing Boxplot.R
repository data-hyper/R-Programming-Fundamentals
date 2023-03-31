getwd()                    #checking the current working directory

library(ggplot2)           #loading ggplot2 package
library(forcats)           #loading forcars package
theme_set(theme_minimal()) #setting the theme for the plot

head(mpg) #viewing first 6 observations of mpg dataset

#plotting basic boxplot of 'hwy' with 'class'
base_boxplot <- ggplot(mpg, aes(x=class, y=hwy)) + geom_boxplot() + labs(title='Basic Boxplot')
base_boxplot

#modifying the boxplot
final_boxplot <- ggplot(mpg, aes(y=fct_reorder(class, hwy, .fun = median), 
                                 x=hwy, alpha=0.5)) +
  
  #notice that we are changing the layout from vertical to horizontal 
  #by switching the x and y variables
  
  geom_point(aes(color=class), position='jitter', alpha=0.5, 
             show.legend = FALSE) +
  
  #adding this layer over base plot to show the distribution of the data points
  
  geom_boxplot(aes(fill=class), width = 0.6, outlier.colour = 'black', 
               outlier.alpha = NA, show.legend = FALSE, alpha=0.3) +
  
  #adding boxplot, no legend, retained outliers in "black" color
  
  stat_summary(fun = "mean", na.rm = TRUE, color = 'red', size=0.5, 
               show.legend = FALSE) +
  
  #Showing 'mean' value. User can now compare mean and median values together
  
  labs(title='Final Boxplot', 
       x = 'Highway Mileage', 
       y='Car Type', 
       subtitle = 'Comparing median and mean "highway mileage" of each "car type"',
       caption = 'Data source: ggplot2')
  
final_boxplot  

#last step: customizing the labels
