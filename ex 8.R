library(readxl)
library(dplyr)
library(ggplot2)
library(tidyr)

data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp8-avgscores.xlsx")

print("Original Data Loaded")
View(data)



data[data == ""] <- NA

data <- data %>%
  mutate(across(everything(), ~ suppressWarnings(as.numeric(.))))

data <- data %>%
  filter(if_any(everything(), ~ !is.na(.)))

print("Cleaned Data")
str(data)


avg_scores <- colMeans(data, na.rm = TRUE)

print("Average Scores:")
print(avg_scores)

avg_df <- data.frame(
  Subject = names(avg_scores),
  Average = as.numeric(avg_scores)
)


data <- data %>%
  mutate(Total = rowSums(., na.rm = TRUE))

print("Data with Total Column Added")
View(data)


top_students <- data %>%
  arrange(desc(Total)) %>%
  head(5)

print("Top 5 Students:")
print(top_students)


ggplot(avg_df, aes(x = Subject, y = Average, fill = Subject)) +
  geom_bar(stat = "identity") +
  ggtitle("Average Marks by Subject") +
  theme_minimal()


ggplot(data, aes(x = Total)) +
  geom_histogram(bins = 10) +
  ggtitle("Distribution of Total Marks") +
  xlab("Total Marks") +
  theme_minimal()


long_data <- data %>%
  select(-Total) %>%
  pivot_longer(cols = everything(),
               names_to = "Subject",
               values_to = "Score",
               values_drop_na = TRUE)

ggplot(long_data, aes(x = Subject, y = Score, fill = Subject)) +
  geom_boxplot() +
  ggtitle("Outlier Detection Across Subjects") +
  theme_minimal()


data$StudentID <- 1:nrow(data)

ggplot(data, aes(x = reorder(StudentID, Total), y = Total)) +
  geom_bar(stat = "identity", fill = "green") +
  coord_flip() +
  ggtitle("Total Marks by Student") +
  xlab("Student") +
  theme_minimal()
