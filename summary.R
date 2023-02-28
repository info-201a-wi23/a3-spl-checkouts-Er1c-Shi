library(dplyr)
library(stringr)
library(tidyverse)
check_out <- read.csv("~/Desktop/INFO201CODES/a3-spl-checkouts-Er1c-Shi/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = F)

#average check out for Little Women
select_item <- check_out %>% 
  filter(str_detect(check_out$Title, "Little Women"))

avg_check_out <- select_item %>% 
  summarise(avg_checkout = mean(Checkouts))

(avg_check_out)

#year least checkout of ebook for Little Women

book_num <- select_item %>% filter(MaterialType == "EBOOK") %>% 
  group_by(CheckoutYear) %>% 
  summarise(year_checkout = sum(Checkouts)) 

year_least_ebook <- book_num[which(book_num$year_checkout == min(book_num$year_checkout)), 'CheckoutYear']

#year most checkout of ebook for little Women

year_most_ebook <- book_num[which(book_num$year_checkout == max(book_num$year_checkout)), 'CheckoutYear']

#average check out for Jane Eyre

avg_check_out_2 <- select_item_2 %>% 
  summarise(avg_checkout = mean(Checkouts))

# year most checkout of for Jane Eyre

book_num_2 <- select_item_2 %>%
  group_by(CheckoutYear) %>% 
  summarise(year_checkout = sum(Checkouts)) 

year_most_book <- book_num_2[which(book_num_2$year_checkout == max(book_num_2$year_checkout)), 'CheckoutYear']
