library(tidyverse)

generate_sales_data <- function(num_entries=10, seed=42){
  set.seed(seed)
  item_ids <-  sample(100:109, num_entries, replace=T)  # ID товаров (100-109)
  quantities <-  sample(1:9, num_entries, replace=T)   # Количество проданных единиц (1-9)
  prices <-  runif(num_entries, 50.0, 500.0)    # Цена за единицу (50.0 - 500.0)
  df <- data.frame(item_ids,quantities,prices)
  return(df)
  
}

variant <- 1
samples <- 10
data <- generate_sales_data(num_entries=samples, seed=variant)

# 1. Общая выручка
# Рассчитайте общую выручку магазина

data %>% 
  mutate(total = quantities * prices)
