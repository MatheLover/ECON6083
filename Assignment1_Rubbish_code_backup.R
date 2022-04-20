Cal simulated bias 
# for(i in 1:ncol(iv_result_frame)){
#   iv_result_frame[paste(as.character( (i-1)* 5), "Bias")] <- iv_result_frame[,i] - 2
# }

Calculate means of bias separately for each column and create a new column to store simulated bias
# for (i in 1:1000){
# iv_result_frame[i,"1stOverallBias"] = mean(iv_result_frame$`1stBias`[i:1000])
# iv_result_frame[i,"5thOverallBias"] = mean(iv_result_frame$`5thBias`[i:1000])
# iv_result_frame[i,"10thOverallBias"] = mean(iv_result_frame$`10thBias`[i:1000])
# iv_result_frame[i,"15thOverallBias"] = mean(iv_result_frame$`15thBias`[i:1000])
# iv_result_frame[i,"20thOverallBias"] = mean(iv_result_frame$`20thBias`[i:1000])
# iv_result_frame[i,"25thOverallBias"] = mean(iv_result_frame$`25thBias`[i:1000])
# iv_result_frame[i,"30thOverallBias"] = mean(iv_result_frame$`30thBias`[i:1000])
# iv_result_frame[i,"35thOverallBias"] = mean(iv_result_frame$`35thBias`[i:1000])
# iv_result_frame[i,"40thOverallBias"] = mean(iv_result_frame$`40thBias`[i:1000])

# }




Create new data frame comprising of Simulated bias and number of IVs
# plot_data <- data.frame(matrix(ncol = 2, nrow = 0))
# colnames(plot_data) <- c("Simulated Bias", 
# "Number of IVs")

# For loop to Construct dataframe for plotting
# column_tracker = 19 # 1stOverallBias column number 
# for (i in c(1,5,10,15,20,25,30,35,40)){
#   # Create column vector of number of vectors for each iv regression 
#   num_iv <- matrix(i, nrow = 1000, ncol=1) 
#   
#   # column bind column vector with simulated bias for each regression
#   iv_data_plot <- cbind(abs(iv_result_frame[,column_tracker]), num_iv)
#   
#   # add to dataframe for plotting 
#   plot_data <- rbind(plot_data, iv_data_plot)
#   
#   # increment column tracker
#   column_tracker <- column_tracker +  1
# }
# plot_data

Plot
# c(rep(1, 1000),rep(5, 1000),rep(10, 1000),rep(15, 1000),
#                     rep(20, 1000),rep(25, 1000),rep(30, 1000),rep(35, 1000),rep(40, 1000))
# as.factor(plot_data$V2)
