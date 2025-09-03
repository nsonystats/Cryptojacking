install.packages(c("rpart", "dplyr", "tree", "Metrics", "rpart.plot"))

library(rpart)
library(dplyr)
library(tree)
library(Metrics)
library(rpart.plot)

NTCC_df <- read.csv("C:/Users/Nitika/Downloads/SHEETNTCC.csv")
missing_values <- sum(is.na(NTCC_df$cpu_total))
if (missing_values > 0) {
  print("Warning: Missing values in the target variable (cpu_total). Impute or remove them.")
}

NTCC_df <- na.omit(NTCC_df)
set.seed(123)
train_indices <- sample(1:nrow(NTCC_df), 0.7 * nrow(NTCC_df))
train_data <- NTCC_df[train_indices, ]
test_data <- NTCC_df[-train_indices, ]

predictors <- c("cpu_guest", "cpu_guest_nice", "cpu_idle", "cpu_iowait", "cpu_irq", 
                "cpu_nice", "cpu_softirq", "cpu_steal", "cpu_system")

tree_model <- rpart(cpu_total ~ ., data = train_data[, c(predictors, "cpu_total")])
tree_predictions <- predict(tree_model, newdata = test_data[, c(predictors, "cpu_total")])
tree_mae <- mae(tree_predictions, test_data$cpu_total)

if (!is.na(tree_mae)) {
  print(paste("Regression Tree MAE:", tree_mae))
} else {
  print("MAE not available.")
}

rpart.plot(tree_model, extra = 1)
