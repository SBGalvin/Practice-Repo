# Histogram
library(tidyverse)
# Pass the dataframe as the data argument to ggplot()
ggplot(data = test_df_long,
       # Set the aesthetics layer
       # x is variable of interest
       # fill sets the colour option
       aes(x = Response, fill = Group))+
  geom_histogram(colour="white")+
  
  # Error bars
  # X error bars (in horizontal position)
  # values generated using a summary table
  # 95% SE conf int.
  # y is set to an arbitrary value
  geom_errorbarh(aes(y = 100, 
                     # minimum value
                     xmin = 97.68,
                     xmax = 99.54),
                 # sets the height of the error bars
                 height = 8)+
  # y error bars (in horizontal position)
  # values generated using a summary table
  # 95% SE conf int.
  # y is set to an arbitrary value
  geom_errorbarh(aes(y = 80, 
                     # min value
                     xmin = 100.00,
                     # max value
                     xmax = 101.84),
                 # sets height of the error bars
                 height = 8)+
  # X mean
  # generated using the point geometry
  # y is set to an arbitrary value, same as line 16
  geom_point(aes(y = 100, x = mean(test_df_long[Group=="x",]$Response)),
             # Sets point colour to white
             colour = "white")+
  # Y mean
  # generated using the point geometry
  # y is set to an arbitrary value, same as line 26
  geom_point(aes(y = 80, x = mean(test_df_long[Group=="y",]$Response)),
             # Sets point colour to white
             colour = "white")+
  # adds the minimal theme to the plot output
  theme_minimal()+
  # Places the legend at the top of the plot
  theme(legend.position = "top")
