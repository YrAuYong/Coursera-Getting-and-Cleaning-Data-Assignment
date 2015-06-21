#Coursera Data Science Course - Getting & Cleaning Data module project Assignment:
#Human Activity Recognition Using Smartphones Dataset Processing

#Raw data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Introduction: This script processes the raw data files from the data source above and generates a tidy
#dataset file, tidy_dataset.txt in accordance to the instructions in the assignment description.
#The generated tidy_dataset.txt file can be read in R using the command:
#> df<- read.table("tidy_dataset.txt", header=TRUE)

#Package required to run this R script.
#At least version 0.2 of dplyr is required to enable this script to use summarise_each function
require(dplyr)

#Raw data files to be processed by this R script
featuresFile <- "UCI HAR Dataset/features.txt"
activityLabelsFile <- "UCI HAR Dataset/activity_labels.txt"
subjectTestFile <- "UCI HAR Dataset/test/subject_test.txt"
xTestfile <- "UCI HAR Dataset/test/x_test.txt"
yTestFile <- "UCI HAR Dataset/test/y_test.txt"
subjectTrainFile <- "UCI HAR Dataset/train/subject_train.txt"
xTrainfile <- "UCI HAR Dataset/train/x_train.txt"
yTrainFile <- "UCI HAR Dataset/train/y_train.txt"
rawfilesVct <- c(featuresFile, activityLabelsFile, subjectTestFile, xTestfile, yTestFile, 
                 subjectTrainFile, xTrainfile, yTrainFile)

#Declaration of tidyDataset identifier to store the dataset which is processed from the Raw data
#files above. The identifier will store the result dataset of each of the 5 main procedures (to
#be used as input for the next procedure) until the final tidy dataset is obtained.
tidyDataset <- data.frame()

#The tidyData function executes the 5 main procedures to obtain the final tidy dataset as instructed
#in the description of this assignment. In this function:
#- the "getdata-projectfiles-UCI HAR Dataset.zip" file is downloaded and unpackaged
#- identifiers required by the data cleaning procedures are declared
#- data cleaning procedure functions are called
#- the final independent tidy data set with the average of each variable for each activity and each
#  subject, is written into a text file "tidy_dataset.txt" in the current directory
#- a Data Viewer is invoked to display the final tidy dataset.
tidyData <- function() {
  prepareRawFiles()
  #Declarations of identifiers that contains tables read from raw files used by procedures below
  features <- read.table(featuresFile)
  activityLabels <- read.table(activityLabelsFile)
  
  #Execute tidy dataset creation procedures:
  mergeData() 
  featRowNums <- extractMeasurements(features)
  #featRowNums is translated to merged dataset column numbers for mean and stddev features where
  #offset of 2 is added to featRowNums for columns subject(1), activity(2) columns
  tidyDataset <<- tidyDataset[, c(1, 2, (featRowNums + 2))] 
  setActivityLabels(activityLabels)  
  renameVariableNames(features, featRowNums)  
  computeAve()
  
  write.table(tidyDataset, file="tidy_dataset.txt", row.name=FALSE)
  View(tidyDataset)
}

#prepareRawFiles ensures all the required raw input files are in place prior running the data cleaning procedures
#- First checks if all the files in rawfilesVct exist, if true then return else next
#- checks if "UCI HAR Dataset" directory exists, if true stop the script and gives user error msg and recommended solution
#- if previous check is false, check that "getdata-projectfiles-UCI HAR Dataset.zip" exists, if not found, download file
#- unzip "getdata-projectfiles-UCI HAR Dataset.zip" file
#- repeat first check, if false gives user error msg on invalid "getdata-projectfiles-UCI HAR Dataset.zip" file and 
#  advise user to provide a valid "getdata-projectfiles-UCI HAR Dataset.zip" file
prepareRawFiles <- function() {  
  if (!all(file.exists(rawfilesVct))) {
    if (dir.exists("UCI HAR Dataset")) {
      msg1 <- "'UCI HAR Dataset' folder exist in current directory "
      msg2 <- "but does not contain all the following required input raw files: \n\n"
      msg3 <- paste0(rawfilesVct, collapse='', sep="\n")
      msg4 <- "\nPlease rename or delete the 'UCI HAR Dataset' folder and rerun run_analysis.R.\n"
      msg5 <- "This script will download required input raw files if the directory does not exists."
      stop(paste0(msg1, msg2, msg3, msg4, msg5))
    } else if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {   
      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                    destfile="./getdata-projectfiles-UCI HAR Dataset.zip", method="curl")
    }
    
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
    
    if (!all(file.exists(rawfilesVct))) {
      stop(paste0("Unable to extract the following required raw input files from ",
                  "'getdata-projectfiles-UCI HAR Dataset.zip'\n\n",
                  paste0(rawfilesVct, collapse='', sep="\n"),
                  "\nPlease provide the correct 'getdata-projectfiles-UCI HAR Dataset.zip' file in ",
                  "the current directory: ", getwd()))
    }
  }
}

#Step 1: Merges the training and the test sets to create one data set.
mergeData <- function() {
  #Create Test dataset
  subjectTestData <- readLines(subjectTestFile)
  xTestData <- read.table(xTestfile)
  yTestData <- readLines(yTestFile)
  testData <- cbind(subject=subjectTestData,activity=yTestData,xTestData)       
  
  #Create Train dataset
  subjectTrainData <- readLines(subjectTrainFile)
  xTrainData <- read.table(xTrainfile)
  yTrainData <- readLines(yTrainFile)
  trainData <- cbind(subject=subjectTrainData,activity=yTrainData,xTrainData)   

  #Merge Test & Train dataset
  tidyDataset <<- rbind(testData,trainData)
  #relevel subject factor
  tidyDataset$subject <<- factor(tidyDataset$subject, levels=1:30)                          
}

#Step2: Extracts only the measurements on the mean and standard deviation for each measurement.
extractMeasurements <- function(features) {
  #returns mean and standard deviation features row numbers
  grep("-(mean|std)\\(\\)", features$V2)
}

#Step3: Uses descriptive activity names to name the activities in the data set
##Assumption: In accordance to the "activity_labels.txt" file, the activity labels in column V2
##            are ordered in asscending order of the respective activity numbers in column V1:
##            > activityLabels
##              V1                 V2
##            1  1            WALKING
##            2  2   WALKING_UPSTAIRS
##            3  3 WALKING_DOWNSTAIRS
##            4  4            SITTING
##            5  5           STANDING
##            6  6             LAYING
setActivityLabels <- function(activityLabels) {
  levels(tidyDataset$activity) <<- as.character(activityLabels$V2)
}

#Step4: Appropriately labels the data set with descriptive variable names.
##Variable naming convention is in accordance to "Data Science - Getting & Cleaning Data" course 
##guidelines in week 4 lecture, where:
##- all lower case when possible (For feature names that is a combination of several words, I have 
##  decided that camel case is more readable)
##- descriptive
##- not duplicated
##- not have underscores or dots or whitespaces (also cleaned off the use of "-", "(" and ")" symbols
##  in the feature names)
renameVariableNames <- function(features, featRowNums) {
  cleanFeat <- gsub("-", "", features$V2[featRowNums])     #Removing "-" symbols
  cleanFeat <- gsub("mean\\(\\)", "Mean", cleanFeat)    #Replacing "mean()" with "Mean"
  cleanFeat <- gsub("std\\(\\)", "Std", cleanFeat)      #Replacing "std()" with "Std"
  cleanFeat <- gsub("BodyBody","Body", cleanFeat)       #Removing extra "Body" due to typo in "features.txt"
  names(tidyDataset)[3:ncol(tidyDataset)] <<- cleanFeat  #Renaming tidyDataset feature variables where feature Names starts at index 3 
}

#Step5: From the data set in step 4, creates a second, independent tidy data set with the average of
#each variable for each activity and each subject.
##summarise_each function is available in dplyr package since version 0.2
computeAve <- function() {
  tidyDataset <<- group_by(tidyDataset,subject,activity)%>%summarise_each(funs(mean))
}

#Execute tidyData function defined above to initiate processing of raw input files to final tidy dataset
tidyData()