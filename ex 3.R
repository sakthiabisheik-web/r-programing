
if (!require(readxl)) {
  install.packages("readxl", dependencies = TRUE)
  library(readxl)
}

if (!require(dplyr)) {
  install.packages("dplyr", dependencies = TRUE)
  library(dplyr)
}

hr_data <- read_excel(file.choose())



cat("\nFirst 6 Rows of Dataset:\n")
print(head(hr_data))

cat("\nStructure of Dataset:\n")
str(hr_data)

cat("\nSummary of Dataset:\n")
print(summary(hr_data))


if (all(c("EmpID","Department","JobRole","MonthlyIncome") %in% colnames(hr_data))) {
  
  selected_data <- hr_data %>%
    select(EmpID, Department, JobRole, MonthlyIncome)
  
  cat("\nSelected Columns:\n")
  print(head(selected_data))
  
  sales_data <- hr_data %>%
    filter(Department == "Sales")
  
  cat("\nSales Department Employees:\n")
  print(head(sales_data))
  
  high_income <- hr_data %>%
    filter(MonthlyIncome > 5000)
  
  cat("\nEmployees with Income > 5000:\n")
  print(head(high_income))
  
  sorted_income <- hr_data %>%
    arrange(desc(MonthlyIncome))
  
  cat("\nTop 5 Highest Paid Employees:\n")
  print(head(sorted_income, 5))
  
  dept_summary <- hr_data %>%
    group_by(Department) %>%
    summarise(
      Average_Income = mean(MonthlyIncome, na.rm = TRUE),
      Maximum_Income = max(MonthlyIncome, na.rm = TRUE),
      Minimum_Income = min(MonthlyIncome, na.rm = TRUE),
      Total_Employees = n()
    )
  
  cat("\nDepartment-wise Salary Summary:\n")
  print(dept_summary)
  
  jobrole_count <- hr_data %>%
    group_by(JobRole) %>%
    summarise(Employee_Count = n()) %>%
    arrange(desc(Employee_Count))
  
  cat("\nEmployee Count by Job Role:\n")
  print(jobrole_count)
  
  hr_data <- hr_data %>%
    mutate(Salary_Category = case_when(
      MonthlyIncome < 3000 ~ "Low",
      MonthlyIncome >= 3000 & MonthlyIncome < 7000 ~ "Medium",
      MonthlyIncome >= 7000 ~ "High"
    ))
  
  cat("\nDataset with Salary Category Added:\n")
  print(head(hr_data))
  
} else {
  cat("\nRequired columns not found in dataset.\n")
}

cat("\nProgram Executed Successfully.\n")