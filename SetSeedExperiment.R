set.seed(1)
A <- rnorm(10)
B <- rnorm(10)
C <- rnorm(10)

set.seed(1)
AA <- rnorm(10)
BB <- rnorm(10)
BA <- rnorm(10)


identical(A, AA)
identical(B, BB)
identical(C, BA)


dgp_1 <- function(n, k){
  # Parameter
  # 1. n -- number of observations 
  # 2. k -- number of controls 
  
  # Generate Di
  ## Generate Xij
  matrix_x <- matrix(rnorm(n*k, mean=0,sd=1), n, k)
  ## Generate Xij mean
  matrix_x_mean <- as.matrix(rowMeans(matrix_x))
  ## Generate Vi
  matrix_v <- matrix(rnorm(n*1, mean=0,sd=0.01), n, 1)
  ## Generate Di
  matrix_d <- matrix_x_mean + matrix_v
  
  # Generate Ui
  matrix_u <- matrix(rnorm(n*1, mean=0,sd=1), n, 1)
  
  # Generate Yi
  matrix_y <- matrix_d + matrix_u
  
  # Rename matrix columns 
  colnames(matrix_y) <- "yi"
  colnames(matrix_d) <- "di"
  colnames(matrix_x) <- c("xi,1","xi,2","xi,3","xi,4","xi,5",
                          "xi,6","xi,7","xi,8","xi,9","xi,10",
                          "xi,11","xi,12","xi,13","xi,14","xi,15",
                          "xi,16","xi,17","xi,18","xi,19","xi,20")
  colnames(matrix_u) <- "ui"
  
  # Column bind the matrixes 
  dataset <- cbind(matrix_y, matrix_d, matrix_x, matrix_u)
  
  # Convert matrix to dataframe 
  dataset.data.frame <- as.data.frame(dataset)
  
  return(dataset.data.frame)
}


# Create simulated values that are reproducible

# Create a empty dataframe storing SE and p-value of the coefficient of Di 
result_frame <- data.frame(matrix(ncol=4, nrow=0))
colnames(result_frame) <- c("SE without control", "P-value without control", "SE with control", "P-value with control")

# Use for loop to do part a to c for 1000 times 
for (i in 1:1000){
  
  # In each time, we generate a dataset 
  dataset.data.frame_2 <- dgp_1(100,20)
  
  # Redo part b
  reg_b_d = lm(yi~di, data=dataset.data.frame_2)
  reg_b_d_df = summary(reg_b_d)$coefficients
  
  # Extract SE and P-value without control
  reg_b_d_df[2,2] # SE without control
  reg_b_d_df[2,4] # P-value without control 
  
  # Redo part c
  reg_c_d= lm(yi~di+`xi,1`+`xi,2`+`xi,3`+`xi,4`+`xi,5`+`xi,6`+`xi,7`+`xi,8`+`xi,9`+`xi,10`+`xi,11`+`xi,12`+`xi,13`+`xi,14`+`xi,15`+`xi,16`+`xi,17`+`xi,18`+`xi,19`+`xi,20`, data=dataset.data.frame_2)
  reg_c_d_df = summary(reg_c_d)$coefficients
  
  # Extract SE and P-value with control
  reg_c_d_df[2,2] # SE with control
  reg_c_d_df[2,4] # P-value with control
  
  # Add SE and p-values with the previous df in a row-wise manner
  result_frame[nrow(result_frame)+1,] <- c(reg_b_d_df[2,2],reg_b_d_df[2,4],reg_c_d_df[2,2],reg_c_d_df[2,4])
  
}







