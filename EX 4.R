
if (!require(readxl)) {
  install.packages("readxl", dependencies = TRUE)
  library(readxl)
}

if (!require(dplyr)) {
  install.packages("dplyr", dependencies = TRUE)
  library(dplyr)
}


car_data <- read_excel("C:/Users/HP/Downloads/EV Experiment 4 CAR sales.xlsx")

cat("\nFirst 6 Rows of Dataset:\n")
print(head(car_data))

cat("\nStructure of Dataset:\n")
str(car_data)



cat("\nMissing Values in Each Column:\n")
print(colSums(is.na(car_data)))

car_data_clean <- car_data %>%
  filter(complete.cases(.))

cat("\nDataset after Removing Missing Values:\n")
print(head(car_data_clean))

car_data_imputed <- car_data %>%
  mutate(across(where(is.numeric),
                ~ ifelse(is.na(.), mean(., na.rm = TRUE), .)))

cat("\nDataset after Mean Imputation:\n")
print(head(car_data_imputed))



remove_outliers <- function(data, column) {
  Q1 <- quantile(data[[column]], 0.25, na.rm = TRUE)
  Q3 <- quantile(data[[column]], 0.75, na.rm = TRUE)
  IQR_value <- Q3 - Q1
  
  lower_bound <- Q1 - 1.5 * IQR_value
  upper_bound <- Q3 + 1.5 * IQR_value
  
  data[data[[column]] >= lower_bound &
         data[[column]] <= upper_bound, ]
}

numeric_cols <- names(car_data_clean)[sapply(car_data_clean, is.numeric)]

car_data_no_outliers <- car_data_clean

for (col in numeric_cols) {
  car_data_no_outliers <- remove_outliers(car_data_no_outliers, col)
}

cat("\nDataset after Removing Outliers:\n")
print(head(car_data_no_outliers))



region_data <- data.frame(
  Region = c("North", "South", "East", "West"),
  Tax_Rate = c(5, 8, 6, 7)
)

if ("Region" %in% colnames(car_data_no_outliers)) {
  blended_data <- left_join(car_data_no_outliers, region_data, by = "Region")
  
  cat("\nBlended Dataset:\n")
  print(head(blended_data))
} else {
  cat("\nNo 'Region' column found for blending. Skipping join step.\n")
}

cat("\nProgram Executed Successfully.\n")