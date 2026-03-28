library(readxl)
library(readr)

data<-read_excel("C:/Users/HP/Downloads/r assignment/Exp10-Chi squarestudent-scores.xlsx")
#1.Is there a significant association between gender and career aspiration?	
chisq.test(table(data$gender,data$career_aspiration))

#2.Is there a relationship between extracurricular activities and career aspirations?	
chisq.test(table(data$extracurricular_activities,data$career_aspiration))

#3.Is there a significant association between career aspiration and preferred study hours (categorized: low, medium, high)?	
data$study_hours<-cut(data$weekly_self_study_hours,
breaks=c(0,10,30,100),labels=c("Low","Medium","High"))
chisq.test(table(data$career_aspiration,data$study_hours))
