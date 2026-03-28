library(readxl)
library(readr)

data<-read_excel("C:/Users/HP/Downloads/r assignment/Exp10-Chi squarestudent-scores.xlsx")
chisq.test(table(data$gender,data$career_aspiration))

chisq.test(table(data$extracurricular_activities,data$career_aspiration))

data$study_hours<-cut(data$weekly_self_study_hours,
breaks=c(0,10,30,100),labels=c("Low","Medium","High"))
chisq.test(table(data$career_aspiration,data$study_hours))
