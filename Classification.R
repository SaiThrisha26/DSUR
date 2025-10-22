install.packages("e1071")        # SVM and Naive Bayes
install.packages("class")        # KNN
install.packages("randomForest") # Random Forest
install.packages("caret")        # Evaluation tools

library(e1071)
library(class)
library(randomForest)
library(caret)

data(iris)
set.seed(123)  # ensures reproducible splits

# 80% training, 20% testing
train_index <- sample(1:nrow(iris), 0.8 * nrow(iris))
train_data <- iris[train_index, ]
test_data  <- iris[-train_index, ]


nb_model <- naiveBayes(Species ~ ., data = train_data)
nb_pred <- predict(nb_model, test_data)
nb_acc <- mean(nb_pred == test_data$Species)


svm_model <- svm(Species ~ ., data = train_data)
svm_pred <- predict(svm_model, test_data)
svm_acc <- mean(svm_pred == test_data$Species)


rf_model <- randomForest(Species ~ ., data = train_data)
rf_pred <- predict(rf_model, test_data)
rf_acc <- mean(rf_pred == test_data$Species)


train_x <- train_data[, 1:4]
train_y <- train_data[, 5]
test_x  <- test_data[, 1:4]
test_y  <- test_data[, 5]

knn_pred <- knn(train = train_x, test = test_x, cl = train_y, k = 5)
knn_acc <- mean(knn_pred == test_y)


results <- data.frame(
  Model = c("Naive Bayes", "SVM", "Random Forest", "KNN"),
  Accuracy = round(c(nb_acc, svm_acc, rf_acc, knn_acc) * 100, 2)
)
print(results)
