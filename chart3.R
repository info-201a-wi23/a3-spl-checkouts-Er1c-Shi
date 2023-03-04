library(dplyr)
library(stringr)
library(tidyverse)
check_out <- read.csv("~/Desktop/INFO201CODES/a3-spl-checkouts-Er1c-Shi/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

# percentage of different materials for Jane Eyre in 2020
select_item_2 <- check_out %>%
  filter(str_detect(check_out$Title, "Jane Eyre"))
select_item_2$'Booktitle' <- "Jane Eyre"

material_checkout_Jane_Eyre <- select_item_2 %>% group_by(CheckoutYear, MaterialType) %>% 
  summarise(year_checkouts = sum(Checkouts))

ggplot(data = material_checkout_Jane_Eyre) +
  geom_line(aes(x = CheckoutYear, 
                y = year_checkouts, 
                col = MaterialType)) + 
  labs(x = 'Year of Checkouts', 
       y = 'Number of Checkouts', 
       title = 'Checkouts of Different Mediums for Jane Eyre') +
  theme_bw()
