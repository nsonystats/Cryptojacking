install.packages("glmnet")
library(glmnet)
data_df <- read.csv("C:/Users/Nitika/Downloads/SHEETNTCC.csv")


missing_values <- sum(is.na(data_df$cpu_total))
if (missing_values > 0) {
  print("Warning: Missing values in the target variable (cpu_total). Impute or remove them.")
}
data_df <- na.omit(data_df)


set.seed(123)
train_indices <- sample(1:nrow(data_df), 0.7 * nrow(data_df))
train_data <- data_df[train_indices, ]
test_data <- data_df[-train_indices, ]


predictors <- c("cpu_guest", "cpu_guest_nice", "cpu_idle", "cpu_iowait", "cpu_irq", 
                "cpu_nice", "cpu_softirq", "cpu_steal", "cpu_system")


x_train <- as.matrix(train_data[, predictors])
y_train <- train_data$cpu_total
x_test <- as.matrix(test_data[, predictors])
y_test <- test_data$cpu_total


cv_model <- cv.glmnet(x_train, y_train, alpha = 1)


lasso_predictions <- predict(cv_model, newx = x_test, s = "lambda.min")


lasso_mae <- mean(abs(lasso_predictions - y_test))

# Plot model
plot(cv_model)
title("Cross-Validated MSE for Lasso")

# Print MAE
print(paste("Lasso MAE:", round(lasso_mae, 4)))
