library(readxl)
library(dplyr)
library(tidyr)
library(readr)
library(openxlsx)

data <- read_excel("C:/Users/HP/Downloads/r assignment/EV Experiment 4 CAR sales.xlsx")

head(data)

car1 <- read_excel("C:/Users/HP/Downloads/r assignment/EV Experiment 4 CAR sales.xlsx", sheet = 1)
car2 <- read_excel("C:/Users/HP/Downloads/r assignment/EV Experiment 4 CAR sales.xlsx", sheet = 2)

colSums(is.na(car1))

car1$...2 <- as.numeric(car1$...2)
mean(car1$...2, na.rm = TRUE)

car1$...4 <- as.numeric(car1$...4)

mean_mileage <- mean(car1$...4, na.rm = TRUE)
car1$...4[is.na(car1$...4)] <- mean_mileage

mean(car1$...4)

# 4. Outlier detection using IQR
car1$...2 <- as.numeric(car1$...2)

boxplot(car1$...2, main = "Boxplot for Price", col = "skyblue")

q1 <- quantile(car1$...2, 0.25, na.rm = TRUE)
q3 <- quantile(car1$...2, 0.75, na.rm = TRUE)

IQR_value <- q3 - q1

lower_bound <- q1 - 1.5 * IQR_value
upper_bound <- q3 + 1.5 * IQR_value

outliers <- car1$...2[car1$...2 < lower_bound | car1$...2 > upper_bound]

outliers

car1_clean <- car1 %>%
  filter(car1$...2 >= lower_bound & car1$...2 <= upper_bound)

car2 <- distinct(car2, ...1, .keep_all = TRUE)

result <- left_join(car1, car2, by = c("DATA FRAME 1" = "...1"))

write.xlsx(result, "C:/Users/HP/Downloads/r assignment/output.xlsx")

getwd()
