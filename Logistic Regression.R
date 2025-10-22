# -----------------------------
# Logistic Regression: Admission Prediction
# -----------------------------

# Step 1: Install required packages (run only once)
# install.packages("foreign")
# install.packages("MASS")
# install.packages("pscl")

# Step 2: Load libraries
library(foreign)
library(MASS)
library(pscl)

# Step 3: Import data from web
data_url <- "https://stats.idre.ucla.edu/stat/data/binary.csv"
admission_data <- read.csv(data_url)

# Step 4: View first few rows
head(admission_data)

# Step 5: Convert 'rank' to categorical variable
admission_data$rank <- factor(admission_data$rank)

# Step 6: Build Logistic Regression model
logit_model <- glm(admit ~ gre + gpa + rank,
                   data = admission_data,
                   family = "binomial")

# Step 7: View model summary
summary(logit_model)

# Step 8: Check model fit using pseudo R-squared
pR2(logit_model)

# Step 9: Predict probabilities for all students
predicted_prob <- predict(logit_model, type = "response")

# Step 10: Convert probabilities to class labels (0 or 1)
predicted_class <- ifelse(predicted_prob > 0.5, 1, 0)

# Step 11: Create confusion matrix
conf_matrix <- table(Predicted = predicted_class, Actual = admission_data$admit)
conf_matrix

# Step 12: Calculate model accuracy
accuracy <- mean(predicted_class == admission_data$admit)
accuracy

# -----------------------------
# Predict admission for new students
# -----------------------------

# Step 13: Create new student data
new_students <- data.frame(
  gre = c(700, 580),
  gpa = c(3.8, 3.2),
  rank = factor(c(1, 3), levels = 1:4)
)

# Step 14: Predict admission probabilities for new students
predicted_prob_new <- predict(logit_model, newdata = new_students, type = "response")

# Step 15: Convert probabilities to predicted class labels
predicted_class_new <- ifelse(predicted_prob_new > 0.5, 1, 0)

# Step 16: Display predictions
predicted_prob_new
predicted_class_new
