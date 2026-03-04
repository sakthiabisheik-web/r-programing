
product <- c("Apples", "Bananas", "Oranges", "Grapes", "Musk melon", "Water melon")
units_sold <- c(50, 70, 40, 60, 25, 50)
price <- c(30, 20, 25, 45, 30, 90)


total_units <- sum(units_sold)
mean_price <- mean(price)
mean_units <- mean(units_sold)


cat("Total Units Sold =", total_units, "\n")
cat("Mean Price =", mean_price, "\n")
cat("Mean Units Sold =", mean_units, "\n")