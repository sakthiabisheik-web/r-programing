
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


data <- read_excel(file.choose())

cat("\nFirst 6 Rows of Dataset:\n")
print(head(data))

cat("\nStructure of Dataset:\n")
str(data)


numeric_cols <- names(data)[sapply(data, is.numeric)]
categorical_cols <- names(data)[sapply(data, function(x) is.character(x) || is.factor(x))]


if (length(numeric_cols) >= 1) {
  ggplot(data, aes_string(x = numeric_cols[1])) +
    geom_density(fill = "skyblue", alpha = 0.5) +
    ggtitle("Density Plot") +
    theme_minimal()
}


if (length(numeric_cols) >= 1 && length(categorical_cols) >= 1) {
  ggplot(data, aes_string(x = categorical_cols[1], 
                          y = numeric_cols[1], 
                          fill = categorical_cols[1])) +
    geom_violin() +
    ggtitle("Violin Plot") +
    theme_minimal()
}

if (length(numeric_cols) >= 2) {
  ggplot(data, aes_string(x = numeric_cols[1], 
                          y = numeric_cols[2])) +
    geom_point(color = "darkgreen") +
    geom_smooth(method = "lm", se = FALSE, color = "red") +
    ggtitle("Scatter Plot with Regression Line") +
    theme_minimal()
}


if (length(numeric_cols) >= 2 && length(categorical_cols) >= 1) {
  ggplot(data, aes_string(x = numeric_cols[1], 
                          y = numeric_cols[2])) +
    geom_point() +
    facet_wrap(as.formula(paste("~", categorical_cols[1]))) +
    ggtitle("Faceted Scatter Plot") +
    theme_minimal()
}


if (length(categorical_cols) >= 1) {
  ggplot(data, aes_string(x = categorical_cols[1])) +
    geom_bar(fill = "steelblue") +
    ggtitle("Bar Chart") +
    theme_minimal()
}

cat("\nAdvanced Graphs Generated Successfully.\n")