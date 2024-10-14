# Decision Tree

# Install the 'rpart' package, which provides tools for creating decision trees
install.packages("rpart")
# Load the 'rpart' library to use the decision tree functions
library("rpart")
# Load the built-in Iris dataset
data(iris)
# Check the structure of the dataset to understand the variables and data types
str(iris)
# Randomly select 110 rows from the dataset to use for training
indexes <- sample(150, 110)
# Print the selected indexes for verification
indexes
# Create a training dataset using the randomly selected rows
iris_train <- iris[indexes, ]
# View the training dataset
iris_train
# Create a test dataset using the remaining rows (those not in the training set)
iris_test <- iris[-indexes, ]
# View the test dataset
iris_test

# Define the target variable and the features for the decision tree
# The model will predict Species based on Sepal.Length, Sepal.Width, Petal.Length, and Petal.Width
target <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
# Print the target formula to ensure it's correctly defined
target
# Create a decision tree model using the training data, with 'method = "class"' for classification
tree <- rpart(target, data = iris_train, method = "class")

# Install the 'rpart.plot' package to visualize the decision tree
install.packages("rpart.plot")
# Load the 'rpart.plot' library to use the plot functions
library("rpart.plot")
# Visualize the decision tree structure using 'rpart.plot'
rpart.plot(tree)
# Use the decision tree to make predictions on the test data
prediction <- predict(tree, iris_test)
# Display the predictions made by the decision tree
prediction
