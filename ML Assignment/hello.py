import sys,pandas as pd,numpy as np,random

def findClosestCentroid(X,centroids):
    K = len(centroids)
    ci = np.zeros((len(X), 1))
    for m in range(0,len(X)):
        distances = np.zeros((len(centroids), 1))
        for k in range(0,K):
            distances[k] = sum((X[m] - centroids[k]) ** 2 )
        x= min(distances)
        index = np.argmin(distances)
        ci[m] = index
    return ci

def computeMeans(X,ci,K):
    row,col=X.shape
    centroids = np.zeros((K, col))
    for i in range(0,K):
        centroids[i] = (1 / len(np.where(ci==i)[0])) * sum(sum(X[np.where(ci==i)[0]]))
    return centroids
        
def initCentroids(X, K):
    centroids = np.zeros((K, X.shape[1]))
    for i in range(0,K):
        if(not(random.choice(X) in centroids)):    
            centroids[i]=random.choice(X)
    return centroids

def kmeans(file,cluster_size):
    data = pd.read_csv(file, sep=" ", header=None)
    row,col=data.shape
    X=data.iloc[:,:].values
    centroids=initCentroids(X,cluster_size)
    for i in range(0,100):
        ci=findClosestCentroid(X,centroids)
        centroids=computeMeans(X,ci,cluster_size)
    df=pd.DataFrame(data=centroids)
    df.to_csv('clusters.txt', sep=' ',index=False,header = False)


if __name__ == "__main__":
    kmeans(sys.argv[1],int(sys.argv[2]))