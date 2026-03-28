library(dplyr)
library(readxl)
library(readr)

data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp7-student-scores.xlsx")

s <- select(data, first_name, math_score)

d <- filter(data, absence_days > 10)

c <- filter(data, extracurricular_activities == TRUE)

a <- arrange(data, math_score)

b <- arrange(data, desc(biology_score))

e <- data %>%
  filter(chemistry_score > 80) %>%
  select(first_name, career_aspiration, chemistry_score) %>%
  arrange(desc(chemistry_score))

f <- data %>%
  group_by(gender) %>%
  summarise(avgscore = mean(math_score, na.rm = TRUE), .groups = "drop")

g <- data %>%
  filter(part_time_job == TRUE) %>%
  summarise(count = n())

s; d; c; a; b; e; f; g
