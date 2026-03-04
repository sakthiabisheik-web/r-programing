

cat("===== ARITHMETIC OPERATIONS =====\n")

a1 <- 10 + 20
cat("10 + 20 =", a1, "\n")

a2 <- 150 / 2
cat("150 / 2 =", a2, "\n")

a3 <- 58 * 65
cat("58 * 65 =", a3, "\n")

t <- 80 - 25
cat("80 - 25 =", t, "\n")

a4 <- 2^3
cat("2^3 =", a4, "\n\n")


cat("===== VARIABLE ASSIGNMENT =====\n")

x <- 10
y <- 5
z <- x + y
cat("Value of z (x + y) =", z, "\n\n")


cat("===== DATA TYPES =====\n")

cat("Class of x:", class(x), "\n")
cat("Class of 'Hello':", class("Hello"), "\n")
cat("Class of TRUE:", class(TRUE), "\n\n")


cat("===== MATHEMATICAL FUNCTIONS =====\n")

cat("Square root of 49 =", sqrt(49), "\n")
cat("Log of 100 (natural log) =", log(100), "\n")
cat("Exponential of 2 =", exp(2), "\n")
cat("Rounded value of 3.14159 =", round(3.14159, 2), "\n\n")


cat("===== SEQUENCE AND REPETITION =====\n")

cat("Sequence from 1 to 20 by 5:\n")
print(seq(1, 20, by = 5))

cat("Repeat 'MBA' 3 times:\n")
print(rep("MBA", 3))
cat("\n")


cat("===== SUMMARY STATISTICS =====\n")

marks <- c(80, 85, 92, 74, 68)

cat("Marks:", marks, "\n")
cat("Mean:", mean(marks), "\n")
cat("Median:", median(marks), "\n")
cat("Standard Deviation:", sd(marks), "\n")
cat("Summary:\n")
print(summary(marks))

cat("\n===== PROGRAM COMPLETED SUCCESSFULLY =====\n")

