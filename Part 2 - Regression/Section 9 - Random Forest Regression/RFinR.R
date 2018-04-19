dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

library(randomForest)
set.seed(123)
regressor=randomForest(x=dataset[1],y=dataset$Salary,ntree = 10)

predict(regressor,newdata = data.frame(Level=6.5))



x_seq=seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary))+
  geom_line(aes(x=x_seq,y=predict(regressor,newdata = data.frame(Level=x_seq))))
# this is the higher resolution Decision Tree

set.seed(123)
regressor=randomForest(x=dataset[1],y=dataset$Salary,ntree = 100)

predict(regressor,newdata = data.frame(Level=6.5))

x_seq=seq(min(dataset$Level),max(dataset$Level),0.001)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary))+
  geom_line(aes(x=x_seq,y=predict(regressor,newdata = data.frame(Level=x_seq))))


set.seed(123)
regressor=randomForest(x=dataset[1],y=dataset$Salary,ntree = 300)

predict(regressor,newdata = data.frame(Level=6.5))

x_seq=seq(min(dataset$Level),max(dataset$Level),0.001)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary))+
  geom_line(aes(x=x_seq,y=predict(regressor,newdata = data.frame(Level=x_seq))))
