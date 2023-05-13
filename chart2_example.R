library(dplyr)
library(tidyverse)
library(ggplot2)
df <- read.csv("Checkouts_by_Title.csv")


EbookData <- df %>%
  filter(MaterialType == "EBOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts), Type = "Ebook")

AudiobookData <- df %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  group_by(CheckoutYear) %>%
  summarise(number = sum(Checkouts), Type = "Audiobook")


chartData1 <- rbind(EbookData, AudiobookData)

ggplot(data = chartData1, aes(x = CheckoutYear, y = number)) +
  geom_line(aes(colour = Type)) +
  ggtitle("Checkouts Number of Audio book and E book from 2017 to 2023") +
  labs(y = "the Number of Checkouts of this Year")

