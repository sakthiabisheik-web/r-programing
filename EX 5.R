
if (!require(readxl)) {
  install.packages("readxl", dependencies = TRUE)
  library(readxl)
}

if (!require(ggplot2)) {
  install.packages("ggplot2", dependencies = TRUE)
  library(ggplot2)
}

if (!require(dplyr)) {
  install.packages("dplyr", dependencies = TRUE)
  library(dplyr)
}

data <- read_excel("C:/Users/HP/Downloads/Exp5.xlsx")

cat("\nFirst 6 Rows of Dataset:\n")
print(head(data))

cat("\nStructure of Dataset:\n")
str(data)


numeric_cols <- names(data)[sapply(data, is.numeric)]
categorical_cols <- names(data)[sapply(data, function(x) is.character(x) || is.factor(x))]


if (length(categorical_cols) >= 1) {
  ggplot(data, aes_string(x = categorical_cols[1])) +
    geom_bar(fill = "steelblue") +
    ggtitle("Bar Chart") +
    theme_minimal()
}


if (length(numeric_cols) >= 1) {
  ggplot(data, aes_string(x = numeric_cols[1])) +
    geom_histogram(fill = "orange", bins = 10) +
    ggtitle("Histogram") +
    theme_minimal()
}


if (length(categorical_cols) >= 1 && length(numeric_cols) >= 1) {
  ggplot(data, aes_string(x = categorical_cols[1],
                          y = numeric_cols[1])) +
    geom_boxplot(fill = "lightgreen") +
    ggtitle("Box Plot") +
    theme_minimal()
}


if (length(numeric_cols) >= 2) {
  ggplot(data, aes_string(x = numeric_cols[1],
                          y = numeric_cols[2])) +
    geom_point(color = "red") +
    ggtitle("Scatter Plot") +
    theme_minimal()
}


if (length(numeric_cols) >= 2) {
  ggplot(data, aes_string(x = numeric_cols[1],
                          y = numeric_cols[2])) +
    geom_line(color = "blue") +
    ggtitle("Line Graph") +
    theme_minimal()
}

cat("\nGraphs Generated Successfully.\n")