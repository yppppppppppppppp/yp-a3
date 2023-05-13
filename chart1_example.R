library(dplyr)
library(tidyverse)
library(ggplot2)
df <- read.csv("Checkouts_by_Title.csv")



BooksonTape <- df %>%
  filter(Publisher == "Books on Tape") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts), Publisher)

RandomHouse <- df %>%
  filter(Publisher == "Random House, Inc.") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts), Publisher)

chartData <- rbind(BooksonTape, RandomHouse)


ggplot(data = chartData, aes(x = CheckoutYear, y = number)) +
  geom_line(aes(colour = Publisher)) +
  ggtitle("Checkouts Number of BooksonTape and RandomHouse from 2017 to 2023") +
  labs(y = "the Number of Checkouts of this Year")
