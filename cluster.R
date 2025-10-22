# -----------------------------
# Clustering Model: Iris Dataset
# -----------------------------

# Load libraries
library(ggplot2)
library(cluster)   # for divisive clustering (diana)

# Load and scale data
data(iris)
iris_scaled <- scale(iris[,1:4])  # remove species column and scale

#set.seed(123)  # reproducibility

# 1. K-means clustering
kmeans_model <- kmeans(iris_scaled, centers = 3, nstart = 25)
iris$KMeans_Cluster <- as.factor(kmeans_model$cluster)

# 2. Agglomerative Hierarchical Clustering
hc_agglom <- hclust(dist(iris_scaled), method = "ward.D2")
iris$Agglomerative_Cluster <- as.factor(cutree(hc_agglom, k = 3))

# 3. Divisive Hierarchical Clustering
hc_divisive <- diana(iris_scaled)
iris$Divisive_Cluster <- as.factor(cutree(as.hclust(hc_divisive), k = 3))

# 4. PCA for 2D visualization
pca <- prcomp(iris_scaled)
pca_data <- data.frame(pca$x[,1:2], iris)

# 5. Plot clusters
plot_cluster <- function(data, cluster_col, title){
  ggplot(data, aes_string(x="PC1", y="PC2", color=cluster_col)) +
    geom_point(size=3) +
    labs(title=title) +
    theme_minimal()
}

p1 <- plot_cluster(pca_data, "KMeans_Cluster", "K-means Clustering")
p2 <- plot_cluster(pca_data, "Agglomerative_Cluster", "Agglomerative Clustering")
p3 <- plot_cluster(pca_data, "Divisive_Cluster", "Divisive Clustering")

print(p1)
print(p2)
print(p3)
head(iris)

# 6. Plot dendrograms
plot(hc_agglom, main="Agglomerative Clustering Dendrogram", xlab="", sub="", labels=FALSE)
plot(as.hclust(hc_divisive), main="Divisive Clustering Dendrogram", xlab="", sub="", labels=FALSE)

