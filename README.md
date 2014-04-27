Description of Project
=================================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.    

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   

Here are the data for the project:   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip    

You should create one R script called run_analysis.R that does the following.  Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement.  Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive activity names.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

Good luck!


# How to run project
=================================

Assuming the following data is in the working environment: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R can be run in R or RStudio to generate the tidy data set described in the CodeBook.md


# How the script works
=================================

Part 1: Merge the training and the test sets to create one data set.
  - Training/Test measurements are read into different variables.
  - Merging (making a union) of both sets using rbind.


Part 2: Extracts only the measurements on the mean and 
standard deviation for each measurement. 
  - Features indices are read into a matrix[idx,featureName]
  - Features are filtered using grep containing "mean" or "std"
  - DataSet columns are filtered by indices returned in second step.
  - Training/Test activities are read into different variables.
  - Merging (making a union) of both sets using rbind.
  - Training/Test subjects are read into different variables.
  - Merging (making a union) of both sets using rbind.
  - Merging measurements,activities,subjects using cbind.


Part 3: Uses descriptive activity names to name the activities 
in the data set
  - Activity column is converted into factor.
  - Activity factor is renamed with descriptive activity names.
  - Activity column is assigned the descriptive factors.


Part 4: Appropriately labels the data set with descriptive activity names.
Assumption: Descriptive names = descriptive column names.
  ***Column names also set in Part 2***


Part 5: Creates a second, independent tidy data set with the average of each 
variable for each activity and each subject. 
  - Data set created above is transformed into a data table.
  - Columns are averaged grouping by "Activity" and "subject"
  - columns are renamed with a descriptive name: 'mean("measurament")'
  - Tidy set is written to a file.
