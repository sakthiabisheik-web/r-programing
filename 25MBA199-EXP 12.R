library(readxl)
library(dplyr)
library(ggplot2)

df <- read_excel("C:/Users/HP/Downloads/r assignment/Exp12 - Simple Linear Regression ML.xlsx")

df <- na.omit(df)


set.seed(123)
indices <- sample(1:nrow(df), 0.8 * nrow(df))

train_data <- df[indices, ]
test_data  <- df[-indices, ]


model <- lm(y ~ x, data = train_data)
summary(model)


relationship <- cor(df$x, df$y, use = "complete.obs")
cat("Correlation Coefficient:", relationship, "\n")


predictions <- predict(model, newdata = test_data)

mse <- mean((test_data$y - predictions)^2)
rmse <- sqrt(mse)

cat("Mean Squared Error (MSE):", mse, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")


comparison <- data.frame(
  Actual_Y = test_data$y,
  Predicted_Y = predictions
)

print("Comparison (First 10 values):")
print(head(comparison, 10))


ggplot(test_data, aes(x = x, y = y)) +
  geom_point(color = "blue") +
  geom_line(aes(y = predictions), color = "red", size = 1) +
  ggtitle("Actual vs Predicted (Test Data)") +
  xlab("Independent Variable (X)") +
  ylab("Dependent Variable (Y)")