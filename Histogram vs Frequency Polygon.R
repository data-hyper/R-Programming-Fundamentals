# Getting current working directory
getwd()

# Installing  required libraries
install.packages("ggplot2")
install.packages("viridis")

# Loading required libraries
library(ggplot2)
library(viridis)

# Importing dummy healthcare data
health_data <- read.csv("dummy.csv")

#Removing missing values in 'SYSBP'
sysbp_notnull <- health_data[!is.na(health_data$SYSBP),]

#Removing missing values from 'DIABP'
bp_notnull <- sysbp_notnull[!is.na(sysbp_notnull$DIABP),]

# Creating custom theme function for the plot
my_theme <- function(){
  theme_light() +
  theme(panel.border = element_rect(colour = 'black', linewidth = 1),
        panel.grid.minor = element_blank(),
        axis.text = element_text(family = "verdana", face="bold", size = 10),
        axis.title.x = element_text(family = "calibri", face='bold', size=16, 
                                    margin = margin(t = 10), colour = "brown"),
        axis.title.y = element_text(family = "calibri", face='bold', size=16, 
                                    margin = margin(r = 10), colour = "brown"),
        plot.title = element_text(family = "times", face='bold', size=20, 
                                  hjust = 0.5, colour = "black"),
        plot.subtitle = element_text(family = "times", face='bold', size=12, 
                                     colour = "blue"),
        plot.caption = element_text(family = "verdana", size=10, colour = "black",
                                    hjust = 0.01),
        legend.position = "top",
        legend.text = element_text(margin = margin(0,10,0,0)),
        legend.title = element_text(family = "verdana", size=14, face='bold')
  )
}

# Creating histogram of systolic blood pressure
histogram_sysbp_alldata <- ggplot(sysbp_notnull, aes(x=SYSBP)) +
  geom_histogram(stat = "bin", bins = 15, fill='lightblue', color='darkblue', 
                 na.rm = T) +
  labs(title = "Histogram - Systolic Blood Pressure",
       subtitle = "Generated on consolidated data across all sites.",
       caption = "Datasource: Dummy data\nPackage: ggplot2\nR Version: 4.2.3",
       x = "Systolic Blood Pressure",
       y = "Count") +
  my_theme()

# Creating frequency polygon of systolic blood pressure
frepoly_sysbp_alldata <- ggplot(sysbp_notnull, aes(x=SYSBP)) + 
  geom_freqpoly(color="darkblue", linewidth=1) +
  labs(title = "Frequency Polygon - Systolic Blood Pressure",
       subtitle = "Generated on consolidated data across all sites.",
       caption = "Datasource: Dummy data\nPackage: ggplot2\nR Version: 4.2.3",
       x = "Systolic Blood Pressure",
       y = "Count") +
  my_theme()

# Creating histogram of systolic BP by site
histogram_sysbp_by_site <- ggplot(bp_notnull) + 
  geom_histogram(aes(x=SYSBP, fill = SITE), color='black', alpha=0.5, na.rm = T, linewidth=0.4) +
  labs(title = "Histogram - Systolic BP by Site",
       subtitle = "Notice how bars could get camouflaged in each other.\nThis is the disadvantage of the histogram when created across a category",
       caption = "Datasource: Dummy data\nPackage: ggplot2\nR Version: 4.2.3",
       x = "Systolic Blood Pressure",
       y = "Count",
       scale_fill_viridis_b(),
       ) +
  my_theme()

# Creating frequency polygon of systolic BP per site
freqpoly_sysbp_by_site <- ggplot(bp_notnull) + 
  geom_freqpoly(aes(x=SYSBP, color = SITE), linewidth=1, na.rm = T) +
  labs(title = "Frequency Polygon - Systolic BP by Site",
       subtitle = "Each line representing corresponding site clearly shows the underline distribution.\nWe can now compare SYS BP distrubution across sites.\ne.g. 'City Hospital' has close to 30 records with SYS BP < 10 however site 'Rural PHC' does not have any observations with SYSBP < 80",
       caption = "Datasource: Dummy data\nPackage: ggplot2\nR Version: 4.2.3",
       x = "Systolic Blood Pressure",
       y = "Count",
       scale_fill_viridis_b(),
  ) +
  my_theme()

# visualizing all plots
histogram_sysbp_alldata
frepoly_sysbp_alldata
histogram_sysbp_by_site
freqpoly_sysbp_by_site
