#trends for different mediums of little women
library(dplyr)
library(stringr)
library(tidyverse)
check_out <- read.csv("~/Desktop/INFO201CODES/a3-spl-checkouts-Er1c-Shi/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

#average check out
select_item <- check_out %>% 
  filter(str_detect(check_out$Title, "Little Women"))

material_checkout_little_women <- select_item %>% group_by(CheckoutYear, MaterialType) %>% 
  summarise(year_checkouts = sum(Checkouts))


library(ggplot2)
ggplot(data = material_checkout_little_women) +
  geom_bar(aes(x = CheckoutYear, y = year_checkouts, fill = MaterialType), stat = 'identity', position = position_dodge()) + 
  labs(x = 'Year of Checkouts', y = 'Number of Checkouts', title = 'Checkouts of different mediums for Little Women') +
  theme_bw()
