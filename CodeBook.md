

Transformations on raw data
##======================================================
## Part 1: 
## Merge the training and the test sets to create 
## one data set.
##======================================================
1.1 Training/Test measurements are read into different variables.
1.2 Merging (making a union) of both sets using rbind.

##======================================================
## Part 2: 
## Extracts only the measurements on the mean and 
## standard deviation for each measurement. 
##======================================================
2.1 Features indices are read into a matrix[idx,featureName]
2.2 Features are filtered using grep containing "mean" or "std"
2.3 DataSet columns are filtered by indices returned in second step.
2.4 Training/Test activities are read into different variables.
2.5 Merging (making a union) of both sets using rbind.
2.6 Training/Test subjects are read into different variables.
2.7 Merging (making a union) of both sets using rbind.
2.8 Merging measurements,activities,subjects using cbind.

##======================================================
## Part 3: 
## Uses descriptive activity names to name the activities in the data set
##======================================================
3.1 Activity column is converted into factor.
3.2 Activity factor is renamed with descriptive activity names.
3.3 Activity column is assigned the descriptive factors.

##======================================================
## Part 4: 
## Appropriately labels the data set with descriptive activity names.
## Assumption: Descriptive names = descriptive column names.
##======================================================
***Column names also set in Part 2***

##======================================================
## Part 5:
## Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 
##======================================================
5.1 Data set created above is transformed into a data table.
5.2 Columns are averaged grouping by "Activity" and "subject"
5.3 columns are renamed with a descriptive name: 'mean("measurament")'
5.4 Tidy set is written to a file.
