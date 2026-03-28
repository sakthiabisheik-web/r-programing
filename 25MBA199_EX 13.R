
if (!require(readxl)) install.packages("readxl", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

library(readxl)
library(dplyr)


car1 <- read_excel("C:/Users/HP/Downloads/r assignment/car.xlsx")


head(car1)
str(car1)


colnames(car1) <- c("Car", "Price", "Body", "Mileage", "EngineV", "EngineType", "Year")


car1$Price <- as.numeric(car1$Price)


car1 <- car1 %>% filter(!is.na(Price))


summary(car1)


Q1 <- quantile(car1$Price, 0.25)
Q3 <- quantile(car1$Price, 0.75)
IQR_value <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value


outliers <- car1 %>%
  filter(Price < lower_bound | Price > upper_bound)

print(outliers)


car_clean <- car1 %>%
  filter(Price >= lower_bound & Price <= upper_bound)


summary(car_clean)


write.csv(car_clean, "clean_car_data.csv", row.names = FALSE)