Code Book for Human Activity Recognition Using Smartphones Dataset - Version 1.0
================================================================================

Study Design
------------
#### the objective is to process Raw Data Files specified in the assignment project for a Coursera course, "Getting and Cleaning Data" instructed by Jeff Leek by producing a tidy data set in accordance to the instructions in the assignment description.

## Operations to produce tidy data set:
1. Download the Raw file, "getdata-projectfiles-UCI HAR Dataset.zip" from the link provided in the assignment description. (See Data Source section below)
2. Unzip "getdata-projectfiles-UCI HAR Dataset.zip"
3. Study the link between the raw datasets and identify the raw datasets required to complete the assignment task by referring to: 
  - "UCI HAR Dataset/README.txt"
  - "UCI HAR Dataset/features_info.txt"
4. Read the following extracted raw data files into data.frames in R
  - UCI HAR Dataset/features.txt
  - UCI HAR Dataset/activity_labels.txt
  - UCI HAR Dataset/test/subject_test.txt
  - UCI HAR Dataset/test/x_test.txt
  - UCI HAR Dataset/test/y_test.txt
  - UCI HAR Dataset/train/subject_train.txt
  - UCI HAR Dataset/train/x_train.txt
  - UCI HAR Dataset/train/y_train.txt
4. Create "test" experiment data.frame by combining data sets in "subject_test.txt", "x_test.txt" and "y_test.txt" files.
5. Create "train" experiment data.frame by combining data sets in "subject_train.txt", "x_train.txt" and "y_train.txt" files.
6. Merge "test" and "train" experiment data.frames.
7. Extract only measurements on the mean and standard deviation for each feature selection described in "UCI HAR Dataset/features_info.txt" from the merged data.frame using "features.txt".
8. Translate the numbers representing the activity name into readable words (see activity variable description below)
9. Rename the feature columns variables with clear and meaningful names in accordance to "Data Science - Getting & Cleaning Data" course guidelines in week 4 lecture, where:
  - all lower case when possible (For feature names that is a combination of several words, it is decided that camel case is more readable)
  - descriptive
  - not duplicated
  - not have underscores or dots or whitespaces (also cleaned off the use of "-", "(" and ")" symbols in the feature names)
10. Calculate average of each feature variable grouped by each subject and activity pair.
11. An R script, "run_analysis.R" is written to automate the steps 1 to 10 above. To run the script use command: source("run_analysis.R") in R.
12. The final tidy data is then written into a file, "tidy_dataset.txt" in the current directory. The file can be read into a data.frame in R with command: 
  - df<- read.table("tidy_dataset.txt", header=TRUE) 
13. The "run_analysis.R" script also invokes a Viewer to display the final data set table in R.

*Refer to "run_analysis.R" and "README.md" for automation implementation details*

Data Source
-----------
- Raw Data Files (input for run_analysis.R script): https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Site whereby the Raw Data are Obtained from : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Variables
---------

#### subject
  - Volunteer Subjects
    - 1..30	Each volunteer subject of the experiment is represented by a number.

#### activity
  - Activity Labels (Each volunteer subjects performed six activities for the experiment)
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

#### tBodyAccMeanX
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyAccMeanY
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyAccMeanZ
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyAccStdX
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyAccStdY
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyAccStdZ
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tGravityAccMeanX
  - Average of Mean Time Domain Gravity Acceleration Signals Measured with Accelerometer in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tGravityAccMeanY
  - Average of Mean Time Domain Gravity Acceleration Signals Measured with Accelerometer in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tGravityAccMeanZ
  - Average of Mean Time Domain Gravity Acceleration Signals Measured with Accelerometer in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tGravityAccStdX
  - Average of Standard Deviation Time Domain Gravity Acceleration Signals Measured with Accelerometer in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tGravityAccStdY
  - Average of Standard Deviation Time Domain Gravity Acceleration Signals Measured with Accelerometer in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tGravityAccStdZ
  - Average of Standard Deviation Time Domain Gravity Acceleration Signals Measured with Accelerometer in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkMeanX
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer in X Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkMeanY
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer in Y Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkMeanZ
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer in Z Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkStdX
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer in X Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkStdY
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer in Y Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkStdZ
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer in Z Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroMeanX
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroMeanY
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroMeanZ
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroStdX
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroStdY
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroStdZ
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkMeanX
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope in X Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkMeanY
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope in Y Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkMeanZ
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope in Z Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkStdX
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope in X Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkStdY
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope in Y Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkStdZ
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope in Z Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### tBodyAccMagMean
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tBodyAccMagStd
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tGravityAccMagMean
  - Average of Mean Time Domain Gravity Acceleration Signals Measured with Accelerometer with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tGravityAccMagStd
  - Average of Standard Deviation Time Domain Gravity Acceleration Signals Measured with Accelerometer with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkMagMean
  - Average of Mean Time Domain Body Acceleration Signals Measured with Accelerometer with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tBodyAccJerkMagStd
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Accelerometer with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroMagMean
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroMagStd
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkMagMean
  - Average of Mean Time Domain Body Acceleration Signals Measured with Gyroscope with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### tBodyGyroJerkMagStd
  - Average of Standard Deviation Time Domain Body Acceleration Signals Measured with Gyroscope with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyAccMeanX
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyAccMeanY
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyAccMeanZ
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyAccStdX
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyAccStdY
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyAccStdZ
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkMeanX
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer in X Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkMeanY
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer in Y Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkMeanZ
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer in Z Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkStdX
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer in X Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkStdY
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer in Y Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkStdZ
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer in Z Direction with Jerk Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroMeanX
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Gyroscope in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroMeanY
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Gyroscope in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroMeanZ
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Gyroscope in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroStdX
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Gyroscope in X Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroStdY
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Gyroscope in Y Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroStdZ
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Gyroscope in Z Direction (Measurements are averaged for each subject and activity pair)
    - Features are normalized and bounded within [-1,1]

#### fBodyAccMagMean
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyAccMagStd
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkMagMean
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Accelerometer with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyAccJerkMagStd
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Accelerometer with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroMagMean
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Gyroscope with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroMagStd
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Gyroscope with Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroJerkMagMean
  - Average of Mean Frequency Domain Body Acceleration Signals Measured with Gyroscope with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]

#### fBodyGyroJerkMagStd
  - Average of Standard Deviation Frequency Domain Body Acceleration Signals Measured with Gyroscope with Jerk and Magnitude Calculation Applied (Measurements are averaged for each subject and activity pair)
  - where Jerk signals were obtained by deriving the body linear acceleration and angular velocity in time
  - where Magnitude of signals were calculated using the Euclidean norm
    - Features are normalized and bounded within [-1,1]
