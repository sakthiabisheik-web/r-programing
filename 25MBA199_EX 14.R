library(arules)
library(arulesViz)
library(readxl)
library(dplyr)

# Corrected file path (use double \\ OR forward slash /)
data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp14-market_basket_transactions dataset.xlsx")

# Reading the items
item_list <- strsplit(as.character(data$Items), ", ")

# Convert to transactions
trans <- as(item_list, "transactions")

summary(trans)

# 1. Association rules for the Items
rules_low <- apriori(trans,
                     parameter = list(supp = 0.1, conf = 0.4, minlen = 2))
summary(rules_low)

rules_high <- apriori(trans,
                      parameter = list(supp = 0.2, conf = 0.5, minlen = 2))
summary(rules_high)

# 2. Strength and relevance of the discovered rules
cat("\n--- Top Rules (Support=0.1, Confidence=0.4) ---\n")
inspect(sort(rules_low, by = "confidence", decreasing = TRUE)[1:10])

cat("\n--- Top Rules (Support=0.2, Confidence=0.5) ---\n")
inspect(sort(rules_high, by = "lift", decreasing = TRUE))

# Visualization
plot(rules_low, method = "graph", engine = "htmlwidget")