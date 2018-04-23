dataset=read.csv('Mall_Customers.csv')
X=dataset[4:5]

# dendrogram

dendrogram=hclust(dist(X,method = 'euclidean'),method = 'ward.D')
plot(dendrogram, main = paste('Dendrogram'),xlab = 'Customers',ylab = 'Euclidean Distance')

# fitting X to HC

hc=hclust(dist(X,method = 'euclidean'),method = 'ward.D')
y_hc=cutree(hc,k=5)

# visualizing HC result

library(cluster)
clusplot(X,y_hc,lines = 0,shade = TRUE,color = TRUE,plotchar = FALSE,span = TRUE)
