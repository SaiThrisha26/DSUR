# Load the built-in Iris dataset
data(iris)
head(iris)

# Select only numeric columns (first 4 columns)
numeric_data <- iris[, 1:4]

# Install 'corrplot' package (if not already installed)
install.packages("corrplot")

# Load the library
library(corrplot)

# Calculate the correlation matrix
corr_matrix <- cor(numeric_data)
print(corr_matrix)

# Plot the correlation matrix
corrplot(
  corr_matrix,
  method = "color",             # Use colored visualization
  addCoef.col = "black",        # Add correlation coefficient in black color
  tl.col = "black",             # Text label color
  number.cex = 0.8,             # Size of correlation numbers
  title = "Correlation Matrix of Iris Data", # Title
  mar = c(0, 0, 1, 0)           # Margins
)

# Perform One-Way ANOVA for Sepal.Length based on Species
anova_result <- aov(Sepal.Length ~ Species, data = iris)

# Display ANOVA summary
summary(anova_result)
