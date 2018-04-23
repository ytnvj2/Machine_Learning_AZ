dataset=read.csv('Mall_Customers.csv')
X=dataset[4:5]

# elbow method

set.seed(100)
wcss=vector()
for(i in 1:10){
  wcss[i]=sum(kmeans(X,i)$withinss)
}
plot(1:10,wcss,type='b',xlab='No. of clusters',ylab = 'Wcss')

#applying k means with 6 clusters
set.seed(29)
kmeans<-kmeans(X,5,iter.max = 300,nstart = 10)

# visualizing
clusplot(X,kmeans$cluster,lines = 0,shade = TRUE,color=TRUE,labels = 2,plotchar = FALSE,span = TRUE)
