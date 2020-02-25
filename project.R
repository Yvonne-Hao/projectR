setwd("C:/rstudio")
library(caret)
heart=read.csv("cleveland.data",na.strings = "?",sep=",",header=FALSE)
summary(heart)
names(heart)=c( "age", "sex", "cp", "trestbps", "chol","fbs", "restecg",
                "thalach","exang", "oldpeak","slope", "ca", "thal", "num")
heart=na.omit(heart)

heart$num[which(heart$num>0)]=1

summary(heart)
boxplot(heart)

set.seed(6)
train=sample(1:nrow(heart),7*nrow(heart)/10)
heart.train=heart[train,]
heart.test=heart[-train,]
dim(heart.train)
dim(heart.test)

heart.train.x=heart.train[,-which(colnames(heart)=="num")]
heart.test.x=heart.test[,-which(colnames(heart)=="num")]

heart.train.y=heart.train$num
heart.test.y=heart.test$num


