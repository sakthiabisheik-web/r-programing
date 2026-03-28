library(ggplot2)
library(dplyr)
library(readxl)
library(readr)

data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp6.xlsx")

head(data)

data$Cost <- as.numeric(data$Cost)

ggplot(data, aes(x = Quarter, y = Cost, fill = Type)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~Year) +
  ggtitle("Quarterly Cost Trend by Type")

ggplot(data %>%
         group_by(Year, Type) %>%
         summarise(Total = sum(Cost), .groups = "drop"),
       aes(x = Type, y = Total, fill = factor(Year))) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Year Comparison by Type")

ggplot(data %>%
         group_by(Quarter) %>%
         summarise(Total = sum(Cost), .groups = "drop"),
       aes(x = Quarter, y = Total, fill = Quarter)) +
  geom_bar(stat = "identity") +
  ggtitle("Highest Spending Quarter")

ggplot(data %>%
         group_by(Year, Type) %>%
         summarise(Total = sum(Cost), .groups = "drop"),
       aes(x = "", y = Total, fill = Type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  facet_wrap(~Year) +
  ggtitle("Yearly Cost Proportion")

ggplot(data, aes(x = Type, y = Cost, fill = Type)) +
  geom_boxplot() +
  ggtitle("Outlier Detection")

max_cost <- max(data$Cost, na.rm = TRUE)

ggplot(data, aes(x = Type, y = Cost, fill = Cost == max_cost)) +
  geom_bar(stat = "identity") +
  ggtitle("Highest Cost Highlighted")

data[data$Cost == max_cost, ]

ggplot(data %>%
         group_by(Year, Type) %>%
         summarise(Total = sum(Cost), .groups = "drop"),
       aes(x = Year, y = Total, color = Type, group = Type)) +
  geom_line() +
  geom_point(size = 3) +
  ggtitle("Yearly Growth/Decline by Type")
