# Check if the needed packages are installed, and installs them if not.

needed <- c("AER", "rmarkdown", "MASS", "sandwich", "ISLR", "plyr", "class", "glmnet",
            "tree", "randomForest", "gbm", "splines", "gam", "e1071", "hdm", "foreign", "knitr", "kableExtra",
            "grf", "devtools")

there<-rownames(installed.packages())

for (pak in needed){
  if (!(pak %in% there)){
    install.packages(pak,dependencies = TRUE)}
}

library(devtools) 
install_github("susanathey/causalTree")
