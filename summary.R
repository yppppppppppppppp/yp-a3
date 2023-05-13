library(dplyr)
library(tidyverse)
library(ggplot2)
df <- read.csv("Checkouts_by_Title.csv")
Audiobook <- df %>% filter(MaterialType == "AUDIOBOOK")
Ebook <- df %>% filter(MaterialType == "EBOOK")

TotalAuidobook <- sum(Audiobook$Checkouts)
TotalEbook <- sum(Ebook$Checkouts)

Audiobook2018 <- sum(Audiobook[Audiobook$CheckoutYear == 2018, ]$Checkouts)
Ebook2018 <- sum(Audiobook[Ebook$CheckoutYear == 2018, ]$Checkouts)

totalCheckouts <- TotalAuidobook + TotalEbook
totalCheckouts2018 <- Audiobook2018 + Ebook2018

AudioPercentage <- round(TotalAuidobook / totalCheckouts, 3)
EbookPercentage <- round(TotalEbook / totalCheckouts, 3)

Audio2018Percent <- round(Audiobook2018 / totalCheckouts2018, 3)
Ebbok2018Percent <- round(Ebook2018 / totalCheckouts2018, 3)

