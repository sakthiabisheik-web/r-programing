
if (!require(readxl)) {
  install.packages("readxl", dependencies = TRUE)
  library(readxl)
}

if (!require(dplyr)) {
  install.packages("dplyr", dependencies = TRUE)
  library(dplyr)
}

if (!require(tidyr)) {
  install.packages("tidyr", dependencies = TRUE)
  library(tidyr)
}


data <- read_excel(file.choose())

cat("\nFirst 6 Rows of Dataset:\n")
print(head(data))

cat("\nStructure of Dataset:\n")
str(data)


cat("\nMissing Values in Each Column:\n")
print(colSums(is.na(data)))


colnames(data) <- make.names(colnames(data))

cat("\nColumn Names After Cleaning:\n")
print(colnames(data))

numeric_cols <- names(data)[sapply(data, is.numeric)]

tidy_data <- data %>%
  pivot_longer(
    cols = all_of(numeric_cols),
    names_to = "Subject",
    values_to = "Score"
  )

cat("\nData in Long Format:\n")
print(head(tidy_data))


tidy_data_clean <- drop_na(tidy_data)

cat("\nCleaned Tidy Data (No Missing Values):\n")
print(head(tidy_data_clean))


tidy_sorted <- tidy_data_clean %>%
  arrange(desc(Score))

cat("\nTop Scores:\n")
print(head(tidy_sorted))


subject_summary <- tidy_data_clean %>%
  group_by(Subject) %>%
  summarise(
    Average_Score = mean(Score, na.rm = TRUE),
    Maximum_Score = max(Score, na.rm = TRUE),
    Minimum_Score = min(Score, na.rm = TRUE)
  )

cat("\nSubject-wise Summary:\n")
print(subject_summary)

cat("\nProgram Executed Successfully.\n")