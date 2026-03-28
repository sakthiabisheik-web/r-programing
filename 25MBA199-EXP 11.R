library(readxl)
library(dplyr)
library(ggplot2)

# Fix file path
students <- read_excel("C:/Users/HP/Downloads/r assignment/Exp11-student score.xlsx")

# Convert to factors (IMPORTANT)
students$gender <- as.factor(students$gender)
students$extracurricular_activities <- as.factor(students$extracurricular_activities)
students$career_aspiration <- as.factor(students$career_aspiration)

# -------------------
# T-TESTS
# -------------------

# 1. Math vs Extracurricular
t1 <- t.test(math_score ~ extracurricular_activities, data = students)
t1

# 2. English vs Gender
t2 <- t.test(english_score ~ gender, data = students)
t2

# 3. Physics vs Study Hours (Above/Below Median)
m <- median(students$weekly_self_study_hours, na.rm = TRUE)

students$study_group <- ifelse(students$weekly_self_study_hours > m, "Above", "Below")
students$study_group <- as.factor(students$study_group)

t3 <- t.test(physics_score ~ study_group, data = students)
t3

# -------------------
# ANOVA
# -------------------

# 4. Chemistry vs Career Aspiration
a1 <- aov(chemistry_score ~ career_aspiration, data = students)
summary(a1)

# 5. History vs Career Aspiration
a2 <- aov(history_score ~ career_aspiration, data = students)
summary(a2)

# 6. Biology vs Absence Days (convert to factor!)
students$absence_days <- as.factor(students$absence_days)

a3 <- aov(biology_score ~ absence_days, data = students)
summary(a3)

# -------------------
# VISUALIZATION
# -------------------

boxplot(math_score ~ extracurricular_activities, data = students,
        main = "Math vs Extracurricular")

boxplot(english_score ~ gender, data = students,
        main = "English vs Gender")

boxplot(physics_score ~ study_group, data = students,
        main = "Physics vs Study Group")