u<-c(50,70,40,60,25,50)
p<-c(30,20,25,45,30,90)
cat('Sum of units sold:',sum(u),"\n")
cat('Mean price:',mean(p),"\n",'Mean units sold:',mean(u))

l<-list('john','male','88,92,78,85,85,75,858,56,42')
cat('gender of student:',l[[2]],"\n")
cat("students marks:",l[[3]])

m<-matrix(c(1500,1000,1800,2000,1200,2500,3000,1500,2800,900,1600,2100),nrow=3)
rownames(m)<-c("Jan","Feb","March");colnames(m)<-c("Product A","Product B","Product C"
                                                   ,"Product D")
m
cat("Product B sales in Feb:",m["Feb","Product B"],"\n")
cat("Product D sales in March:",m["March","Product D"])

id<-c(101,102,103,104,105,106,107,108,109,110)
name<-c('notebook','pen','T-shirt','coffee mug','backpack','notebook','pen','T-shirt','coffee mug','backpack')
category<-c('stationary','stationary','apparel','kitchenware','bags','stationary','stationary','apparel','kitchenware','bags')
price<-c(50,10,250,150,800,50,10,250,150,800)
sold<-c(30,100,25,15,8,30,100,25,15,8)
p<-data.frame(id,name,category,price,sold)
p$category<-as.factor(p$category)
cat('Various Category:','\n',levels(p$category),'\n')
cat('Count of each category:','\n')
print(table(p$category))
