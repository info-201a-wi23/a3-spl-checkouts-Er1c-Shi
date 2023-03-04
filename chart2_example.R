library(dplyr)
library(stringr)
library(tidyverse)
check_out <- read.csv("~/Desktop/INFO201CODES/a3-spl-checkouts-Er1c-Shi/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

select_item <- check_out %>% 
  filter(str_detect(check_out$Title, "Little Women"))
select_item$'Booktitle' <- "Little Women"

select_item_2 <- check_out %>%
  filter(str_detect(check_out$Title, "Jane Eyre"))
select_item_2$'Booktitle' <- "Jane Eyre"

Dt <- rbind(select_item, select_item_2)
Dt <- Dt %>% group_by(CheckoutYear, Booktitle) %>% summarise(Count = sum(Checkouts))

library(ggplot2)
ggplot(data = Dt) +
  geom_line(aes(x = CheckoutYear, y = Count, col = Booktitle)) + 
  labs(x = 'Year of Checkouts', y = 'Number of Checkouts', title = "Compare the Numbers of Checkouts") + 
  theme_bw()
