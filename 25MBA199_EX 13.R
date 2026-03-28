# -----------------------------------------
# INSTALL & LOAD PACKAGES
# -----------------------------------------
if (!require(readxl)) install.packages("readxl", dependencies = TRUE)
if (!require(dplyr)) install.packages("dplyr", dependencies = TRUE)

library(readxl)
library(dplyr)

# -----------------------------------------
# READ EXCEL FILE (FIX YOUR PATH)
# -----------------------------------------
car1 <- read_excel("C:/Users/HP/Downloads/r assignment/car.xlsx")

# -----------------------------------------
# CHECK DATA
# -----------------------------------------
head(car1)
str(car1)

# -----------------------------------------
# FIX COLUMN NAMES (IMPORTANT)
# -----------------------------------------
colnames(car1) <- c("Car", "Price", "Body", "Mileage", "EngineV", "EngineType", "Year")

# -----------------------------------------
# CONVERT PRICE TO NUMERIC (SAFE)
# -----------------------------------------
car1$Price <- as.numeric(car1$Price)

# -----------------------------------------
# REMOVE NA VALUES
# -----------------------------------------
car1 <- car1 %>% filter(!is.na(Price))

# -----------------------------------------
# SUMMARY STATISTICS
# -----------------------------------------
summary(car1)

# -----------------------------------------
# OUTLIER DETECTION (IQR METHOD)
# -----------------------------------------
Q1 <- quantile(car1$Price, 0.25)
Q3 <- quantile(car1$Price, 0.75)
IQR_value <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

# -----------------------------------------
# FIND OUTLIERS
# -----------------------------------------
outliers <- car1 %>%
  filter(Price < lower_bound | Price > upper_bound)

print(outliers)

# -----------------------------------------
# REMOVE OUTLIERS
# -----------------------------------------
car_clean <- car1 %>%
  filter(Price >= lower_bound & Price <= upper_bound)

# -----------------------------------------
# FINAL CLEAN DATA
# -----------------------------------------
summary(car_clean)

# -----------------------------------------
# SAVE CLEAN DATA
# -----------------------------------------
write.csv(car_clean, "clean_car_data.csv", row.names = FALSE)