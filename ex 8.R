
if (!require(readxl)) {
  install.packages("readxl", dependencies = TRUE)
  library(readxl)
}

if (!require(dplyr)) {
  install.packages("dplyr", dependencies = TRUE)
  library(dplyr)
}


data <- read_excel(file.choose())

cat("\nFirst 6 Rows of Dataset:\n")
print(head(data))

cat("\nStructure of Dataset:\n")
str(data)

colnames(data) <- make.names(colnames(data))

cat("\nCleaned Column Names:\n")
print(colnames(data))


data <- distinct(data)

cat("\nData after Removing Duplicates:\n")
print(head(data))


cat("\nMissing Values in Each Column:\n")
print(colSums(is.na(data)))


data <- data %>%
  mutate(across(where(is.numeric),
                ~ ifelse(is.na(.), mean(., na.rm = TRUE), .)))

cat("\nData after Replacing Missing Numeric Values with Mean:\n")
print(head(data))


remove_outliers <- function(df, column) {
  
  Q1 <- quantile(df[[column]], 0.25, na.rm = TRUE)
  Q3 <- quantile(df[[column]], 0.75, na.rm = TRUE)
  IQR_value <- Q3 - Q1
  
  lower_bound <- Q1 - 1.5 * IQR_value
  upper_bound <- Q3 + 1.5 * IQR_value
  
  df[df[[column]] >= lower_bound & df[[column]] <= upper_bound, ]
}

numeric_cols <- names(data)[sapply(data, is.numeric)]

data_no_outliers <- data

for (col in numeric_cols) {
  data_no_outliers <- remove_outliers(data_no_outliers, col)
}

cat("\nData after Removing Outliers:\n")
print(head(data_no_outliers))

cat("\nFinal Cleaned Dataset Ready for Analysis.\n")