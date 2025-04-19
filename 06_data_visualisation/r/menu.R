library(tidyverse)
library(readr)
menu <- read_csv("06_data_visualisation/r/menu.csv")

glimpse(menu)


menu %>% 
  filter(Calories < 500,
         `Vitamin A (% Daily Value)` > 50) %>% 
  ggplot(aes(Calories, `Vitamin A (% Daily Value)`,colour  = Category))+
  geom_point()

menu %>% 
  filter(Calories < 500,
         `Vitamin A (% Daily Value)` > 50) %>% 
  group_by(Category, Item) %>% 
  summarise(
    n = n()
  )
