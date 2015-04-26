# GettingandCleaningDataProject

## Course project for Coursera's Getting and Cleaning Data

#### Introduction

The run_analysis.R script, comprises a sequence of logical steps used to create a tidy data set with the average of each variable for each activity and each subject. 

These steps are carried out against data collected from the accelerometers from the Samsung Galaxy S smartphone found in the  zip file below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A more indepth description the data is provided in the link below:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

 The following is a list of all files used from the downloaded zip file which were deemed necessary to create the tidy dataset :
 
 * features.txt 
 * activity_labels.txt 
 * train/X_train.txt 
 * train/y_train.txt
 * train/subject_train.txt
 * test/X_test.txt 
 * test/y_test.txt 
 * test/subject_test.txt

####  Requirements for running the run_anaylis.R

 The follow are a list of assumptions which are required inorder to successful execute the run_anaylis.R script.

 * The dplyr package is installed on the user's machine
 * The zip file mentioned in the introduction section has be downloaded and extracted.
 * The user is logged into R and is the root of extracted folder.

####  Outline of the run_anaylis.R Script

 The  R script is broken down into 6 functional sections shown below :
 
 * Data Loading
 * Step 1 - Merging the training and the test sets to create one data set.
 * Step 2 - Extracting only the measurements on the mean and standard deviation for each measurement.
 * Step 3 - Using descriptive activity names to name the activities in the data set.
 * Step 4 - Appropriately labelling the data set with descriptive variable names.
 * Step 5 - From the dataset in step 4, creating a tidy data set with the average of each variable for each activity and each subject.
 
 The script follows the order of the list above and is annotated  accordingly for ease of understanding.
 




