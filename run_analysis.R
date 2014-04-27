##======================================================
## Setting environment path
## 
## ** Not needed as instructions say the script can assume
## ** Samsung data is in the working directory.
##======================================================
## setwd("E:\\Coursera\\DataScienceSpecialization\\3 Getting and Cleaning Data\\Week3\\PeerAssessment")
## safeDownload <- function(url, destinationName){
##     if(!file.exists(destinationName)){
##         download.file(url, destfile=destinationName)
##         dateDownloaded <- date()
##     }
## }

##======================================================
## Preprocess: Downloading data files
##
## ** Not needed as instructions say the script can assume
## ** Samsung data is in the working directory.
##======================================================
## fileName <- "wearable.zip"
## url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## safeDownload(url, fileName)
## Files extracted by hand

##======================================================
## Part 1: 
## Merge the training and the test sets to create 
## one data set.
##======================================================
## 1.1 Training/Test measurements are read into different variables.
## 1.2 Merging (making a union) of both sets using rbind.
##
## 1.3 Training/Test activities are read into different variables.
## 1.4 Merging (making a union) of both sets using rbind.
##
## 1.5 Training/Test subjects are read into different variables.
## 1.6 Merging (making a union) of both sets using rbind.
##
## 1.7 Merging measurements,activities,subjects using cbind.

fileName = "UCI HAR Dataset\\train\\X_train.txt"
trainSet <- read.table(fileName, header=FALSE)
fileName = "UCI HAR Dataset\\test\\X_test.txt"
testSet <- read.table(fileName, header=FALSE)
dataSet <- rbind(trainSet,testSet)

##======================================================
## Part 2: 
## Extracts only the measurements on the mean and 
## standard deviation for each measurement. 
##======================================================
## 2.1 Features indices are read into a matrix[idx,featureName]
## 2.2 Features are filtered using grep containing "mean" or "std"
## 2.3 DataSet columns are filtered by indices returned in second step.

fileName = "UCI HAR Dataset\\features.txt"
features <- read.table(fileName, header=FALSE, stringsAsFactors = FALSE)
meanStdFeatures <- features[grep("mean|std", features[,2]),]
meanStdDataSet <- dataSet[,meanStdFeatures[,1]]

## 2.4 Training/Test activities are read into different variables.
## 2.5 Merging (making a union) of both sets using rbind.
##
## 2.6 Training/Test subjects are read into different variables.
## 2.7 Merging (making a union) of both sets using rbind.
##
## 2.8 Merging measurements,activities,subjects using cbind.

fileName = "UCI HAR Dataset\\train\\Subject_train.txt"
subjectTrainSet <- read.table(fileName, header=FALSE)
fileName = "UCI HAR Dataset\\test\\Subject_test.txt"
subjectTestSet <- read.table(fileName, header=FALSE)
subjectDataSet <- rbind(subjectTrainSet,subjectTestSet)

fileName = "UCI HAR Dataset\\train\\y_train.txt"
activityTrainSet <- read.table(fileName, header=FALSE)
fileName = "UCI HAR Dataset\\test\\y_test.txt"
activityTestSet <- read.table(fileName, header=FALSE)
activityDataSet <- rbind(activityTrainSet,activityTestSet)

meanStdDataSet <- cbind(meanStdDataSet, activityDataSet)
meanStdDataSet <- cbind(meanStdDataSet, subjectDataSet)
names(meanStdDataSet) <- c(meanStdFeatures[,2], "Activity", "Subject")

##======================================================
## Part 3: 
## Uses descriptive activity names to name the activities in the data set
##======================================================
## 3.1 Activity column is converted into factor.
## 3.2 Activity factor is renamed with descriptive activity names.
## 3.3 Activity column is assigned the descriptive factors.

library(plyr)
activitiesIds <- meanStdDataSet[,"Activity"]
activitiesFactors <- as.factor(activitiesIds)
activitiesFactors = revalue(activitiesFactors, c("1"="WALKING", "2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING"))
meanStdDataSet[,"Activity"] = activitiesFactors

##======================================================
## Part 4: 
## Appropriately labels the data set with descriptive activity names.
## Assumption: Descriptive names = descriptive column names.
##======================================================
## ***Column names also set in Part 2***

names(meanStdDataSet) <- c(meanStdFeatures[,2], "Activity", "Subject")

##======================================================
## Part 5:
## Creates a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 
##======================================================
## 5.1 Data set created above is transformed into a data table.
## 5.2 Columns are averaged grouping by "Activity" and "subject"
## 5.3 columns are renamed with a descriptive name: 'mean("measurament")'
## 5.4 Tidy set is written to a file.

library(data.table)
tidyDataTable <- data.table(meanStdDataSet)
avgTidyDataTable <- tidyDataTable[, lapply(.SD,mean), by=c("Activity","Subject")]
newColNames = sapply(names(avgTidyDataTable)[-(1:2)], function(name) paste("mean(", name, ")", sep=""))
setnames(avgTidyDataTable, names(avgTidyDataTable), c("Activity", "Subject", newColNames))
write.csv(avgTidyDataTable, file="MeasureAvgTidySet.txt", , row.names = FALSE)
