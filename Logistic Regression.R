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


# Step 6: Convert 'rank' to categorical variable
admission_data$rank <- factor(admission_data$rank)

# Step 7: Build Logistic Regression model
logit_model <- glm(admit ~ gre + gpa + rank,
                   data = admission_data,
                   family = "binomial")

# Step 8: View model summary
summary(logit_model)

# Step 9: Check model fit using pseudo R-squared
pR2(logit_model)

# Step 10: Predict probabilities for all students
predicted_prob <- predict(logit_model, type = "response")

# Step 11: Convert probabilities to class labels (0 or 1)
predicted_class <- ifelse(predicted_prob > 0.5, 1, 0)

# Step 12: Create confusion matrix
table(Predicted = predicted_class, Actual = admission_data$admit)

# Step 13: Calculate model accuracy
mean(predicted_class == admission_data$admit)
