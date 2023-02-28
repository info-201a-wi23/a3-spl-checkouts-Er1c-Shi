library(dplyr)
library(stringr)
library(tidyverse)
check_out <- read.csv("~/Desktop/INFO201CODES/a3-spl-checkouts-Er1c-Shi/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

# percentage of different materials for Jane Eyre in 2020

material_checkout_Jane_Eyre <- select_item_2 %>% group_by(CheckoutYear, MaterialType) %>% 
  summarise(year_checkouts = sum(Checkouts))

ggplot(data = material_checkout_Jane_Eyre) +
  geom_bar(aes(x = CheckoutYear, y = year_checkouts, fill = MaterialType), stat = 'identity', position = position_dodge()) + 
  labs(x = 'Year of Checkouts', y = 'Number of Checkouts', title = 'Checkouts of different mediums for Jane Eyre') +
  theme_bw()
