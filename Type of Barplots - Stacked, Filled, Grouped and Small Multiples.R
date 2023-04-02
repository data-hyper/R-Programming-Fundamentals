#loading libraries
library(ggplot2)
library(dplyr)
library(forcats)
library(viridis)

#setting the theme for the plots
theme_set(theme_minimal())

#Creating dataset
head(mpg) #using dataset from 'ggplot2' package

colnames(mpg) #checking variable names

#creating stacked barplot
stacked_barplot <- ggplot(mpg, aes(y=manufacturer, fill=class)) + 
  
  geom_bar(position = "stack") +
  
  labs(title = "Stacked Barplot \n(Not good for relative comparison)",
       subtitle = "Car Count By Category and Manufacturer",
       y="Manufacturers",
       x="Count of Cars",
       fill = "Car Categories",
       caption = "Dataset: mpg\nSource: ggplot2") +
  
  scale_fill_viridis_d(option = "E") + #applying 'viridis' color theme
  
  theme(plot.title = element_text(family = "Times New Roman",
                                  face = "bold",
                                  color = "red",
                                  size = 20,
                                  hjust = 0.5),
        
        plot.subtitle = element_text(family = "Calibri",
                                     face = "bold",
                                     color = "darkblue",
                                     size = 18,
                                     hjust = 0.5),
        
        axis.text = element_text(face = "bold",
                                  size = 12),
        
        axis.title = element_text(family = "Calibri",
                                  face = "bold",
                                  color = "blue",
                                  size = 16,
                                  hjust = 0.5),
        
        legend.title = element_text(family = "Calibri",
                                    face = "bold",
                                    color = "blue",
                                    size = 16),
        
        legend.text = element_text(size = 12)
        )

stacked_barplot

#Notice that this layout of the bar chart does not serve the purpose of 
# comparing two categorical data because length of each bar is different
#hence relative comparison of 'Class' with 'Manufacturer' cannot be done

#creating 'filled' barplot
filled_barplot <- ggplot(mpg, aes(y=manufacturer, fill=class)) + 
  
  geom_bar(position = "fill") +
  
  labs(title = "Filled Barplot \n(Better than 'Stacked' but not the best)",
       subtitle = "Car Count Distribution By Category and Manufacturer",
       y="Manufacturers",
       x="Count of Cars",
       fill = "Car Categories",
       caption = "Dataset: mpg\nSource: ggplot2") +
  
  scale_fill_viridis_d(option = 'E') + #applying 'viridis' color theme
  
  theme(plot.title = element_text(family = "Times New Roman",
                                  face = "bold",
                                  color = "darkorange",
                                  size = 20,
                                  hjust = 0.5),
        
        plot.subtitle = element_text(family = "Calibri",
                                     face = "bold",
                                     color = "darkblue",
                                     size = 18,
                                     hjust = 0.5),
        
        axis.text = element_text(face = "bold",
                                 size = 12),
        
        axis.title = element_text(family = "Calibri",
                                  face = "bold",
                                  color = "blue",
                                  size = 16,
                                  hjust = 0.5),
        
        legend.title = element_text(family = "Calibri",
                                    face = "bold",
                                    color = "blue",
                                    size = 16),
        
        legend.text = element_text(size = 12),
        
        panel.background = element_rect(color="grey",
                                        linewidth = 1,
                                        linetype = "solid"),
        
        plot.background = element_rect(color="black",
                                       linewidth = 1,
                                       linetype = "solid")
  )

filled_barplot

#Filled barplots are much better than 'stacked' ones because they all have same 
# width/height hence within group comparison is much easier.
# However relatinve comparison across the groups in different bars is stil 
# difficult because the starting point of each section is different
# Human eye may not be able to compare them accurately

#creating 'grouped' barplot
grouped_barplot <- ggplot(mpg, aes(y=manufacturer, fill=class)) + 
  
  geom_bar(position = position_dodge2(preserve = "single")) +
  
  labs(title = "Grouped Barplot \n(Acceptable for relative comparison)",
       subtitle = "Car Count By Category and Manufacturer",
       y="Manufacturers",
       x="Count of Cars",
       fill = "Car Categories",
       caption = "Dataset: mpg\nSource: ggplot2") +
  
  scale_fill_viridis_d(option = 'E') + #applying 'viridis' color theme
  
  theme(plot.title = element_text(family = "Times New Roman",
                                  face = "bold",
                                  color = "brown",
                                  size = 20,
                                  hjust = 0.5),
        
        plot.subtitle = element_text(family = "Calibri",
                                     face = "bold",
                                     color = "darkblue",
                                     size = 18,
                                     hjust = 0.5),
        
        axis.text = element_text(face = "bold",
                                 size = 12),
        
        axis.title = element_text(family = "Calibri",
                                  face = "bold",
                                  color = "blue",
                                  size = 16,
                                  hjust = 0.5),
        
        legend.title = element_text(family = "Calibri",
                                    face = "bold",
                                    color = "blue",
                                    size = 16),
        
        legend.text = element_text(size = 12),
        
        panel.background = element_rect(color="grey",
                                        linewidth = 1,
                                        linetype = "solid"),
        
        plot.background = element_rect(color="black",
                                       linewidth = 1,
                                       linetype = "solid")
  )

grouped_barplot

#creating 'small multiple' barplot 
small_multiple_barplot <- ggplot(mpg, aes(x=manufacturer, fill=class)) + 
  
  geom_bar(show.legend = FALSE) +
  
  facet_wrap(vars(class), ncol = 2) +
  
  labs(title = "Small Multiples Barplot \n(Ideal layout for relative comparison)",
       subtitle = "Car Count By Category and Manufacturer",
       x="Manufacturers",
       y="Count of Cars",
       caption = "Dataset: mpg\nSource: ggplot2") +
       
  scale_fill_viridis_d(option='E') + #applying 'viridis' color theme
  
  theme(plot.title = element_text(family = "Times New Roman",
                                  face = "bold",
                                  color = "darkgreen",
                                  size = 20,
                                  hjust = 0.5),
        
        plot.subtitle = element_text(family = "Calibri",
                                     face = "bold",
                                     color = "darkblue",
                                     size = 18,
                                     hjust = 0.5),
        
        axis.text.x =  element_text(face = "bold",
                                 size = 10,
                                 angle = 90),
        
        axis.text.y =  element_text(face = "bold",
                                    size = 8),
        
        axis.title = element_text(family = "Calibri",
                                  face = "bold",
                                  color = "blue",
                                  size = 16,
                                  hjust = 0.5),
        
        panel.background = element_rect(color="grey",
                                        linewidth = 1,
                                        linetype = "solid"),
        
        panel.grid.major.x = element_blank(),
        
        
        plot.background = element_rect(color="black",
                                       linewidth = 1,
                                       linetype = "solid")
  )

small_multiple_barplot

#showing all plots
stacked_barplot
filled_barplot
grouped_barplot
small_multiple_barplot

