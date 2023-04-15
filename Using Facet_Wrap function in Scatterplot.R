#loading required libraries
library(ggplot2)

#Using "iris" dataset from ggplot2 package
dim(iris)

#Viewing first 6 observations of the dataset
head(iris)

# Creating custom function for the theme
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
          strip.background = element_rect(fill = "gray40", , color='black'),
          strip.text = element_text(color = 'white', size=12),
          legend.position = "right",
          legend.text = element_text(margin = margin(0,0,0,0), size=10, face='bold'),
          legend.title = element_text(family = "verdana", size=14, face='bold')
    )
}

#creating simple scatter plot on "iris" dataset
scatterplot_1 <- ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(mapping = aes(color = Species), size = 5, alpha=0.5) +
  labs(title = "Scatterplot #1", 
       subtitle = "Viewing all datapoints together colored by 'Species'",
       caption = "Dataset: Iris\nPackages used: ggplot2\nR version: 4.2.2") +
  my_theme()


scatterplot_1

#Now let's use facet_wrap to make it more impactful
set.seed(42)
scatterplot_facet_wrap <- ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(mapping = aes(color = Species), size = 5, position="jitter", 
             alpha=0.6, show.legend = FALSE) +
  facet_wrap(vars(Species)) +
  labs(title = "Scatterplot #2", 
       subtitle = "Dedicated view of the datapoints by 'Species'",
       caption = "Dataset: Iris\nPackages used: ggplot2\nR version: 4.2.2") +
  my_theme()

scatterplot_facet_wrap

#Let's represent each 'species' along with datapoint from other specific for relative comparison

scatterplot_facet_wrap_comparison <- ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(data = iris[-5], color="gray", size=5, alpha=0.3, position = "jitter") +
  geom_point(mapping = aes(color = Species), size = 5, show.legend = FALSE, alpha=0.6, position = "jitter") +
  facet_wrap(vars(Species)) +
  labs(title = "Scatterplot #3", 
       subtitle = "Highlighting each 'Species' among other species for relative comparison",
       caption = "Dataset: Iris\nPackages used: ggplot2\nR version: 4.2.2") +
  my_theme()

scatterplot_facet_wrap_comparison

