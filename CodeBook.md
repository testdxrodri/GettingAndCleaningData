# Analysis of Human Activity Recognition Using Smartphones Dataset 
The R Script run_analysis.R reads and processes data from UCI Human Activity Recognition(HAR) dataset. 


## Input Data - UCI HAR Dataset (from README.txt file)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The third line in the run_analysis.R script that sets working directory needs to adjusted for your setting. The data set directory UCI HAR Dataset need to exist in the working directory. The output file is also created in the working directory.

## Description
run_analysis.R reads X and Y training and test data using rbind. Activity labels are added to y data using join( from plyr) operation. Columns which has mean and standard deviation data are selected using grep command on x data column names. x and y data are then combined using cbind function. Average values of mean and standard deviation of observations grouped by activity is then calculated using lapply function.

##Output:
Output file averageData.csv is generated using write.table with row.names set to FALSE to create a tidy data set without row numbers.


