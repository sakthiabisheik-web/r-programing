library(readxl)
library(readr)
library(ggplot2)

data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp 9-Advertising data.xlsx")

data$TV <- as.numeric(data$TV)
data$Radio <- as.numeric(data$Radio)
data$Newspaper <- as.numeric(data$Newspaper)
data$Sales <- as.numeric(data$Sales)

cor_tv <- cor(data$TV, data$Sales, use = "complete.obs")
cor_tv

cor_radio <- cor(data$Radio, data$Sales, use = "complete.obs")
cor_radio


cor_matrix <- cor(data[, c("TV", "Radio", "Newspaper", "Sales")],
                  use = "complete.obs")
cor_matrix

cov_tv <- cov(data$TV, data$Sales, use = "complete.obs")
cov_radio <- cov(data$Radio, data$Sales, use = "complete.obs")
cov_news <- cov(data$Newspaper, data$Sales, use = "complete.obs")

cov_tv
cov_radio
cov_news


ggplot(data, aes(x = TV, y = Sales)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  ggtitle("TV Advertising vs Sales")

ggplot(data, aes(x = Radio, y = Sales)) +
  geom_point() +
  geom_smooth(method = "lm", color = "green") +
  ggtitle("Radio Advertising vs Sales")

ggplot(data, aes(x = Newspaper, y = Sales)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red") +
  ggtitle("Newspaper Advertising vs Sales")