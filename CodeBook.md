# Description of data
A full description of raw data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Raw data transformation produces a tidy data set that includes both the training and 
test data sets. Feature names with the format "mean.X" are the avg of the feature X 
grouped by "Activity" and "Subject". the tidy data set contains the following features:
 [1] "Activity"
 [2] "Subject"
 [3] "mean.tBodyAcc.mean...X."              
 [4] "mean.tBodyAcc.mean...Y."              
 [5] "mean.tBodyAcc.mean...Z."              
 [6] "mean.tBodyAcc.std...X."               
 [7] "mean.tBodyAcc.std...Y."               
 [8] "mean.tBodyAcc.std...Z."               
 [9] "mean.tGravityAcc.mean...X."           
[10] "mean.tGravityAcc.mean...Y."           
[11] "mean.tGravityAcc.mean...Z."           
[12] "mean.tGravityAcc.std...X."            
[13] "mean.tGravityAcc.std...Y."            
[14] "mean.tGravityAcc.std...Z."            
[15] "mean.tBodyAccJerk.mean...X."          
[16] "mean.tBodyAccJerk.mean...Y."          
[17] "mean.tBodyAccJerk.mean...Z."          
[18] "mean.tBodyAccJerk.std...X."           
[19] "mean.tBodyAccJerk.std...Y."           
[20] "mean.tBodyAccJerk.std...Z."           
[21] "mean.tBodyGyro.mean...X."             
[22] "mean.tBodyGyro.mean...Y."             
[23] "mean.tBodyGyro.mean...Z."             
[24] "mean.tBodyGyro.std...X."              
[25] "mean.tBodyGyro.std...Y."              
[26] "mean.tBodyGyro.std...Z."              
[27] "mean.tBodyGyroJerk.mean...X."         
[28] "mean.tBodyGyroJerk.mean...Y."         
[29] "mean.tBodyGyroJerk.mean...Z."         
[30] "mean.tBodyGyroJerk.std...X."          
[31] "mean.tBodyGyroJerk.std...Y."          
[32] "mean.tBodyGyroJerk.std...Z."          
[33] "mean.tBodyAccMag.mean..."             
[34] "mean.tBodyAccMag.std..."              
[35] "mean.tGravityAccMag.mean..."          
[36] "mean.tGravityAccMag.std..."           
[37] "mean.tBodyAccJerkMag.mean..."         
[38] "mean.tBodyAccJerkMag.std..."          
[39] "mean.tBodyGyroMag.mean..."            
[40] "mean.tBodyGyroMag.std..."             
[41] "mean.tBodyGyroJerkMag.mean..."        
[42] "mean.tBodyGyroJerkMag.std..."         
[43] "mean.fBodyAcc.mean...X."              
[44] "mean.fBodyAcc.mean...Y."              
[45] "mean.fBodyAcc.mean...Z."              
[46] "mean.fBodyAcc.std...X."               
[47] "mean.fBodyAcc.std...Y."               
[48] "mean.fBodyAcc.std...Z."               
[49] "mean.fBodyAcc.meanFreq...X."          
[50] "mean.fBodyAcc.meanFreq...Y."          
[51] "mean.fBodyAcc.meanFreq...Z."          
[52] "mean.fBodyAccJerk.mean...X."          
[53] "mean.fBodyAccJerk.mean...Y."          
[54] "mean.fBodyAccJerk.mean...Z."          
[55] "mean.fBodyAccJerk.std...X."           
[56] "mean.fBodyAccJerk.std...Y."           
[57] "mean.fBodyAccJerk.std...Z."           
[58] "mean.fBodyAccJerk.meanFreq...X."      
[59] "mean.fBodyAccJerk.meanFreq...Y."      
[60] "mean.fBodyAccJerk.meanFreq...Z."      
[61] "mean.fBodyGyro.mean...X."             
[62] "mean.fBodyGyro.mean...Y."             
[63] "mean.fBodyGyro.mean...Z."             
[64] "mean.fBodyGyro.std...X."              
[65] "mean.fBodyGyro.std...Y."              
[66] "mean.fBodyGyro.std...Z."              
[67] "mean.fBodyGyro.meanFreq...X."         
[68] "mean.fBodyGyro.meanFreq...Y."         
[69] "mean.fBodyGyro.meanFreq...Z."         
[70] "mean.fBodyAccMag.mean..."             
[71] "mean.fBodyAccMag.std..."              
[72] "mean.fBodyAccMag.meanFreq..."         
[73] "mean.fBodyBodyAccJerkMag.mean..."     
[74] "mean.fBodyBodyAccJerkMag.std..."      
[75] "mean.fBodyBodyAccJerkMag.meanFreq..." 
[76] "mean.fBodyBodyGyroMag.mean..."        
[77] "mean.fBodyBodyGyroMag.std..."         
[78] "mean.fBodyBodyGyroMag.meanFreq..."    
[79] "mean.fBodyBodyGyroJerkMag.mean..."    
[80] "mean.fBodyBodyGyroJerkMag.std..."     
[81] "mean.fBodyBodyGyroJerkMag.meanFreq..."


#Transformations on raw data
Part 1: Merge the training and the test sets to create one data set.
  - Training/Test measurements are read into different variables.
  - Merging (making a union) of both sets using rbind.


Part 2: Extracts only the measurements on the mean and 
standard deviation for each measurement. 
  - Features indices are read into a matrix[idx,featureName]
  2.2 Features are filtered using grep containing "mean" or "std"
  2.3 DataSet columns are filtered by indices returned in second step.
  2.4 Training/Test activities are read into different variables.
  2.5 Merging (making a union) of both sets using rbind.
  2.6 Training/Test subjects are read into different variables.
  2.7 Merging (making a union) of both sets using rbind.
  2.8 Merging measurements,activities,subjects using cbind.


Part 3: Uses descriptive activity names to name the activities 
in the data set
  3.1 Activity column is converted into factor.
  3.2 Activity factor is renamed with descriptive activity names.
  3.3 Activity column is assigned the descriptive factors.


Part 4: Appropriately labels the data set with descriptive activity names.
Assumption: Descriptive names = descriptive column names.
  ***Column names also set in Part 2***


Part 5: Creates a second, independent tidy data set with the average of each 
variable for each activity and each subject. 
  5.1 Data set created above is transformed into a data table.
  5.2 Columns are averaged grouping by "Activity" and "subject"
  5.3 columns are renamed with a descriptive name: 'mean("measurament")'
  5.4 Tidy set is written to a file.
