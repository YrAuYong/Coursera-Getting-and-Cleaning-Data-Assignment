# Coursera Data Science Course - Getting & Cleaning Data module project Assignment:
## Human Activity Recognition Using Smartphones Dataset Processing - Version 1.0

## Objective:
- Process Raw Data Files specified in the assignment project for Coursera course "Getting and Cleaning Data" instructed by Jeff Leek by producing:
  1. a tidy data set
  2. a link to a Github repository with your script for performing the analysis
  3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
  4. a README.md in the repo with the run_analysis.R script. This repo explains how all of the scripts work and how they are connected.

## Criteria of tidy dataset file
- In accordance to the instructions in the assignment description the criteria involves 5 steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Raw data source: 
- Raw Data File, "getdata-projectfiles-UCI HAR Dataset.zip" (input for run_analysis.R script) provided in course assignment descriptions: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Site whereby the Raw Data is obtained from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Required Raw files input for run_analysis.R script:
- UCI HAR Dataset/features.txt
- UCI HAR Dataset/activity_labels.txt
- UCI HAR Dataset/test/subject_test.txt
- UCI HAR Dataset/test/x_test.txt
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/train/subject_train.txt
- UCI HAR Dataset/train/x_train.txt
- UCI HAR Dataset/train/y_train.txt

## Assumptions:
- File data structure of extracted "getdata-projectfiles-UCI HAR Dataset.zip" is as in the link archive provided in the course assignment description site.
- The format of the raw files extracted "getdata-projectfiles-UCI HAR Dataset.zip" is as in the link archive provided in the course assignment description site.
- Installation of package dplyr (minimum version 0.2 is required to enable the use of summarise_each function) is required by run_analysis.R script.

## Usage of run_analysis.R script:
1. Prereq:
  - Ensure package dplyr is installed (refer to Assumptions section above)
  - setwd in R the directory containing the run_analysis.R script and if posible download the raw data file "getdata-projectfiles-UCI HAR Dataset.zip" in the same working directory
2. run command "source("run_analysis.R")" in R
3. The "run_analysis.R" is tested to work properly in R studio, "R version 3.2.0 (2015-04-16)" installed in a windows 7 environment
4. With machine spec i7 CPU and 16G RAM, and in the condition where "getdata-projectfiles-UCI HAR Dataset.zip" does not exist in the current working directory, the "run_analysis.R" script execution time measured with system.time() function is as follow (note that most of the time is used to download the raw data file):
    ```
    > system.time(source("run_analysis.R"))
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100 59.6M  100 59.6M    0     0   756k      0  0:01:20  0:01:20 --:--:--  965k
       user  system elapsed 
      23.51    0.66  105.87
    ```
5. When the "run_analysis.R" run is completed, you should expect to find :
  - the final tidy dataset written into "tidy_dataset.txt" file in the current working directory. The "tidy_dataset.txt" file can be read into a dataframe in R with command: 
      ```
      > df<- read.table("tidy_dataset.txt", header=TRUE)
      ```
  - a Data Viewer is invoked to display the final tidy dataset.

## Implementation of run_analysis.R script:
1. An identifier, tidyDataset is created to store the output dataset for each of the 5 main procedures (to be used as input for the next procedure) until the final tidy dataset is obtained.
2. When the run_analysis.R script is sourced, tidyData() function is executed to initiate processing of raw input files to final tidy dataset
3. The tidyData function executes the 5 main procedures (as listed in the "Criteria of tidy dataset file" section above) to obtain the final tidy dataset. In this function:
  - the "getdata-projectfiles-UCI HAR Dataset.zip" file is downloaded and unzipped through prepareRawFiles() function
  - identifiers required by the data cleaning procedures are declared
  - data cleaning procedure functions are called (in sequennce of mergeData(), extractMeasurements(), setActivityLabels(), renameVariableNames(), computeAve())
  - the final independent tidy data set with the average of each variable for each activity and each subject, is written into a text file "tidy_dataset.txt" in the current working directory
  - a Data Viewer is invoked to display the final tidy dataset.
4. prepareRawFiles() function ensures all the required raw input files are in place prior running the data cleaning procedures
  - First checks if all the files in rawfilesVct exist, if true then return else next
  - Checks if "UCI HAR Dataset" directory exists, if true stop the script and gives user error msg and recommended solution
  - If previous check is false, check that "getdata-projectfiles-UCI HAR Dataset.zip" exists, if not found, download file
  - Unzip "getdata-projectfiles-UCI HAR Dataset.zip" file
  - Repeat first check, if false gives user error msg on invalid "getdata-projectfiles-UCI HAR Dataset.zip" file and advise user to provide a valid "getdata-projectfiles-UCI HAR Dataset.zip" file
5. mergeData() function
  - Creates Test dataframe
  - Creates Train dataframe
  - Merge Test & Train dataset in a single dataframe
  - Relevel subject factor in the merged dataframe so that the dataset can be arranged in a tidy sequence of subject number in ascending order
6. extractMeasurements() function returns mean and standard deviation features row numbers
7. setActivityLabels() function uses descriptive activity names in activity_labels.txt to name the activities in the data set
8. renameVariableNames() function appropriately labels the data set with descriptive variable names. The variable naming convention is in accordance to "Data Science - Getting & Cleaning Data" course guidelines in week 4 lecture, where:
  - all lower case when possible (For feature names that is a combination of several words, I have decided that camel case is more readable)
  - descriptive
  - not duplicated
  - not have underscores or dots or whitespaces (I have also cleaned off the use of "-", "(" and ")" symbols in the feature names)
9. computeAve() function calculates the average of each feature variable grouped by each subject and activity pair

## Acknowledgement 
The successful completion of this assignment is not without help from the Community TAs (notably from David Hood) and various helpful forum posts on the Coursera course, to reference a few:
- https://class.coursera.org/getdata-015/forum/thread?thread_id=26
- https://class.coursera.org/getdata-015/forum/thread?thread_id=27 
- https://class.coursera.org/getdata-015/forum/thread?thread_id=112#comment-276
