library(readxl)
library(dplyr)

d<-read_excel(file.choose())
s<-d%>%filter(Department=="Sales")
s

e<-d%>%filter(MonthlyIncome >3000 & EducationField=="Medical")
print(e)

a<-arrange(d,MonthlyIncome)
print(a)

Dept<-arrange(d,Department,MonthlyIncome)
Dept

D<-arrange(d,desc(Department))
D

mutate(d,Bonus=MonthlyIncome*0.10)

d%>%
  summarise(avg=mean(MonthlyIncome))

d%>%
  group_by(Department) %>%
  summarise(avg=mean(MonthlyIncome),count=n())

d%>%
  group_by(Department)%>%
  summarise(avg=mean(MonthlyIncome),count=n())%>%
  arrange(desc(avg))%>%
  slice(1)

d%>%
  group_by(Department)%>%
  summarise(avg=mean(MonthlyIncome),count=n())%>%
  arrange(desc(count))%>%
  slice(1)

  
