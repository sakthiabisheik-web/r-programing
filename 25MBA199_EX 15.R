library(dplyr)
library(lubridate)
library(readxl)

# Read file (your path fixed)
data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp15 - RFM Analysis dataset.xlsx")

# Check columns
print(colnames(data))

# ---------------------------
# FIX COLUMN NAMES IF NEEDED
# ---------------------------
# (Uncomment and adjust ONLY if names are different)
# data <- data %>%
#   rename(
#     CustomerID = `Customer ID`,
#     InvoiceDate = `Invoice Date`,
#     Quantity = `Quantity`,
#     UnitPrice = `Unit Price`,
#     InvoiceNo = `Invoice No`
#   )

# Remove missing CustomerID
data <- data %>% filter(!is.na(CustomerID))

# ---------------------------
# DATE FIX (handles multiple formats)
# ---------------------------
data$InvoiceDate <- parse_date_time(data$InvoiceDate,
                                    orders = c("ymd HMS", "dmy HMS", "mdy HMS"))

# Check if conversion worked
summary(data$InvoiceDate)

# ---------------------------
# CREATE TOTAL AMOUNT
# ---------------------------
data <- data %>%
  mutate(TotalAmount = Quantity * UnitPrice)

# Reference date
reference_date <- max(data$InvoiceDate, na.rm = TRUE)

# ---------------------------
# RFM CALCULATION
# ---------------------------
rfm <- data %>%
  group_by(CustomerID) %>%
  summarise(
    Recency = as.numeric(reference_date - max(InvoiceDate, na.rm = TRUE)),
    Frequency = n_distinct(InvoiceNo),
    Monetary = sum(TotalAmount, na.rm = TRUE),
    .groups = "drop"
  )

print(rfm)

# ---------------------------
# RFM SCORING
# ---------------------------
rfm_scored <- rfm %>%
  mutate(
    R_Score = ntile(-Recency, 3),
    F_Score = ntile(Frequency, 3),
    M_Score = ntile(Monetary, 3),
    RFM_Score = paste0(R_Score, F_Score, M_Score)
  )

print(rfm_scored)