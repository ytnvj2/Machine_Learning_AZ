import sys,pandas as pd,numpy as np
from random import sample

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

def computeCentroids(X, ci):
    subX=[] 
    for i in range(0,len(np.unique(ci))):
        subX.append(np.array([X[m] for m in range(0,X.shape[0]) if ci[m] == i]))#creates subset of X with common cluster index
    return np.array([np.mean(thisX,axis=0) for thisX in subX]) #finds mean of each set of points in clusters
        
def initCentroids(X, K):
    rand_indices = sample(range(0,X.shape[0]),K) # selects random indices from X
    return np.array([X[i] for i in rand_indices]) # return ndarray with values of the random indices

def kmeans(file,cluster_size):
    data = pd.read_csv(file, sep=" ", header=None)
    row,col=data.shape
    X=data.iloc[:,:].values
    centroids=initCentroids(X,cluster_size)
    for i in range(0,100):
        ci=findClosestCentroid(X,centroids)
        centroids=computeCentroids(X,ci)
    df=pd.DataFrame(data=centroids)
    df.to_csv('clusters.txt', sep=' ',index=False,header = False)


if __name__ == "__main__":
    kmeans(sys.argv[1],int(sys.argv[2]))