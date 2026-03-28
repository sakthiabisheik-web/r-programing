library(dplyr)
library(lubridate)
library(readxl)

data <- read_excel("C:/Users/HP/Downloads/r assignment/Exp15 - RFM Analysis dataset.xlsx")

print(colnames(data))


data <- data %>% filter(!is.na(CustomerID))


data$InvoiceDate <- parse_date_time(data$InvoiceDate,
                                    orders = c("ymd HMS", "dmy HMS", "mdy HMS"))

summary(data$InvoiceDate)


data <- data %>%
  mutate(TotalAmount = Quantity * UnitPrice)

reference_date <- max(data$InvoiceDate, na.rm = TRUE)


rfm <- data %>%
  group_by(CustomerID) %>%
  summarise(
    Recency = as.numeric(reference_date - max(InvoiceDate, na.rm = TRUE)),
    Frequency = n_distinct(InvoiceNo),
    Monetary = sum(TotalAmount, na.rm = TRUE),
    .groups = "drop"
  )

print(rfm)


rfm_scored <- rfm %>%
  mutate(
    R_Score = ntile(-Recency, 3),
    F_Score = ntile(Frequency, 3),
    M_Score = ntile(Monetary, 3),
    RFM_Score = paste0(R_Score, F_Score, M_Score)
  )

print(rfm_scored)