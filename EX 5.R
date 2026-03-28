library(ggplot2)
library(dplyr)
library(readxl)

data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp5.xlsx")

head(data)


ggplot(data, aes(x = Quarter, y = Cost, fill = Type)) +
  geom_bar(stat = "identity", position = "dodge")


data %>%
  filter(Year == 2018, Quarter == "Q3") %>%
  group_by(Type) %>%
  summarise(total = sum(Cost, na.rm = TRUE)) %>%
  arrange(desc(total)) %>%
  slice(1)


ggplot(data, aes(x = Quarter, y = Cost, fill = Type)) +
  geom_bar(stat = "identity")


data %>%
  filter(Type == "Service") %>%   # FIXED case
  filter(Cost == max(Cost, na.rm = TRUE))

ggplot(data %>% filter(Type == "Service"),
       aes(x = Quarter, y = Cost)) +
  geom_bar(stat = "identity", fill = "pink") +
  ggtitle("Service cost per Quarter")


ggplot(data, aes(x = Quarter, y = Cost, color = Type, group = Type)) +
  geom_line() +
  geom_point()


ggplot(data %>% filter(Quarter == "Q4"),
       aes(x = "", y = Cost, fill = Type)) +
  geom_bar(stat = "identity", width = 1) +   # FIXED typo
  coord_polar("y")


ggplot(data, aes(x = Type, y = Cost)) +
  geom_boxplot()
