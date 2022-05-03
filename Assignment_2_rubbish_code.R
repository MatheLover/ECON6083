if (lasso1.model$beta[1, 1] != 0) {
  # Scenario 1 -- lambda 1 and  Lasso including the first regressor Xi,1
  counter_1 <- 1 # Requirement satisfied and Record frequency
}
if (counter_1 == 1 &
    sum(lasso1.model$beta != 0) > 1) {
  # Scenario 2 -- lambda 1 and Lasso inclduing at least one of the irrelevant regressors
  counter_2 <- 1
}