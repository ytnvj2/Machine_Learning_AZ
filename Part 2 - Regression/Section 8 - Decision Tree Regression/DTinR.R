dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]
install.packages('rpart')
library(rpart)
regressor=rpart(formula = Salary ~ .,data = dataset)
predict(regressor,newdata = data.frame(Level=6.5))
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary))+
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = dataset)))
#This graph is due to number of conditional splits, here no split and no condition
regressor=rpart(formula = Salary ~ .,data = dataset,control = rpart.control(minsplit = 1))
predict(regressor,newdata = data.frame(Level=6.5))
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary))+
  geom_line(aes(x=dataset$Level,y=predict(regressor,newdata = dataset)))
#This graph is due to low resolution
x_seq=seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary))+
  geom_line(aes(x=x_seq,y=predict(regressor,newdata = data.frame(Level=x_seq))))
# this is the higher resolution Decision Tree