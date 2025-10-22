# -----------------------------------------
# MULTIPLE REGRESSION MODEL - IRIS DATASET
# -----------------------------------------

# Step 1: Load the built-in Iris dataset
data(iris)
head(iris)   # Show first few rows of the dataset

# -----------------------------------------
# Part (a): Build and Evaluate the Model
# -----------------------------------------

# Step 2: Build Multiple Regression Model
# Predict Sepal.Length using Sepal.Width, Petal.Length, and Petal.Width
iris_model <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)

# Step 3: View model summary
summary(iris_model)

# Step 4: Evaluate model performance
# R-squared value (measures how well the model fits)
rsq <- summary(iris_model)$r.squared
print(paste("R-squared:", round(rsq, 3)))

# Mean Absolute Error (average difference between actual and predicted values)
mae <- mean(abs(iris$Sepal.Length - predict(iris_model, newdata = iris)))
print(paste("Mean Absolute Error:", round(mae, 3)))


# -----------------------------------------
# Part (b): Predict on New Data
# -----------------------------------------

# Step 1: (Optional) Load dataset again
data(iris)

# Step 2: Build the same model again
iris_model2 <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)

# Step 3: Create new data for prediction
new_flowers <- data.frame(
  Sepal.Width  = c(3.0, 2.8),
  Petal.Length = c(4.5, 5.0),
  Petal.Width  = c(1.5, 1.8)
)

# Step 4: Predict Sepal.Length for new flowers
predicted_sepal <- predict(iris_model2, newdata = new_flowers)

# Step 5: Print predicted values
print("Predicted Sepal.Length for new flowers:")
print(predicted_sepal)
