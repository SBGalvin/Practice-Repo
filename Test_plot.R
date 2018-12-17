options(stringsAsFactors = FALSE,
        scipen = 999)

library(tidyverse)

test_df  <-  data.frame(x = rnorm(1000, 99, 15),
                        y = rnorm(1000, 101, 15))

test_df %>% 
  
  # wide to long
  gather(Group, Response, x:y) ->> test_df_long

test_df_long %>% 
  ggplot(aes(x = Response, fill = Group))+
  geom_histogram(colour="white")+
  facet_wrap(~Group)+
  theme_minimal()

