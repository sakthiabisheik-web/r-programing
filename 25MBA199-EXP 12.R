library(readxl)
library(dplyr)
library(ggplot2)

# Fix file path
df <- read_excel("C:/Users/HP/Downloads/r assignment/Exp12 - Simple Linear Regression ML.xlsx")

# Remove missing values
df <- na.omit(df)

# ---------------------------
# Train-Test Split (80-20)
# ---------------------------
set.seed(123)
indices <- sample(1:nrow(df), 0.8 * nrow(df))

train_data <- df[indices, ]
test_data  <- df[-indices, ]

# ---------------------------
# RQ1: Model Effectiveness
# ---------------------------
model <- lm(y ~ x, data = train_data)
summary(model)

# ---------------------------
# RQ2: Strength & Direction
# ---------------------------
relationship <- cor(df$x, df$y, use = "complete.obs")
cat("Correlation Coefficient:", relationship, "\n")

# ---------------------------
# RQ3: Model Accuracy
# ---------------------------
predictions <- predict(model, newdata = test_data)

mse <- mean((test_data$y - predictions)^2)
rmse <- sqrt(mse)

cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")

# ---------------------------
# RQ4: Actual vs Predicted
# ---------------------------
comparison <- data.frame(
  Actual_Y = test_data$y,
  Predicted_Y = predictions
)

print("Comparison (First 10 values):")
print(head(comparison, 10))

# ---------------------------
# Visualization (Better Plot)
# ---------------------------
ggplot(test_data, aes(x = x, y = y)) +
  geom_point(color = "blue") +
  geom_line(aes(y = predictions), color = "red", size = 1) +
  ggtitle("Actual vs Predicted (Test Data)") +
  xlab("Independent Variable (X)") +
  ylab("Dependent Variable (Y)")