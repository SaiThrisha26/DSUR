
# Step 1: Load the dataset
data(iris)
head(iris)

# Step 2: Perform one-way ANOVA for Sepal.Length based on Species
anova_sepal <- aov(Sepal.Length ~ Species, data = iris)

# Step 3: Display ANOVA summary
summary(anova_sepal)

# Step 4: Perform ANOVA for Petal.Length (optional)
anova_petal <- aov(Petal.Length ~ Species, data = iris)
summary(anova_petal)

# Step 5: Visualize differences using boxplots
boxplot(Sepal.Length ~ Species,
        data = iris,
        col = c("lightblue", "lightgreen", "lightpink"),
        main = "Sepal Length across Species",
        xlab = "Species",
        ylab = "Sepal Length")

boxplot(Petal.Length ~ Species,
        data = iris,
        col = c("lightblue", "lightgreen", "lightpink"),
        main = "Petal Length across Species",
        xlab = "Species",
        ylab = "Petal Length")

# Step 6: Interpretation Message
cat("\nInterpretation:\n")
cat("The ANOVA results show that Sepal.Length and Petal.Length differ significantly among the three species,\n")
cat("as indicated by very small p-values (< 0.05), meaning species has a significant effect on these measurements.\n")
