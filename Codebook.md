##### The Following is a list of the enviroment variables created and used in run_Analysis.R File:

* HomeDir - a character vairable used to store the current home directory at the  beginning of the script to       facilitate the  navigation through sub folders while loading the data.               

* activity  -  A dataframe used to store the list of all activities from the activity_labels.txt  file  found in the root of data directory. The dataframe is populated using the read.table function  in R with the header parameter set to FALSE.

* features - A dataframe used to store the list of all features from the features.txt  file  found in the root of data directory. The dataframe is populated using the read.table function  in R with the header parameter set to FALSE.

* x_train - A dataframe used to store the data imported from X_train.txt file in the Train subdirectory in the root data directory. The dataframe is populated using the read.table function in R with the header parameter set to FALSE.

* y_train - A dataframe used to store the data imported from y_train.txt file in the Train subdirectory in the root data directory. The dataframe is populated using the read.table function  in R with the header parameter set to FALSE.

* subject_train - A dataframe used to store the data imported from subject_train.txt file in the Train subdirectory in the root data directory. The dataframe is populated using the read.table function  in R with the header parameter set to FALSE.

* x_test - A dataframe used to store the data imported from X_test.txt file in the Test subdirectory in the root data directory. The dataframe is populated using the read.table function in R with the header parameter set to FALSE.

* y_test - A dataframe used to store the data imported from y_test.txt file in the Test subdirectory in the root data directory. The dataframe is populated using the read.table function in R with the header parameter set to FALSE.

* subject_test - A dataframe used to store the data imported from subject_test.txt file in the Test subdirectory in the root data directory. The dataframe is populated using the read.table function  in R with the header parameter set to FALSE.

* mergedTest - A dataframe created by binding the columns of subject_test, y_test and  x_test as an intermediary step in creating, the single data set in Step 1 of the assignment.

* mergedTrain - A dataframe created by binding the columns of subject_train, y_train and  x_train as an intermediary step in creating, the single data set in Step 1 of the assignment.

* AllData - A dataframe created by binding the  rows of mergedTest and mergedTrain to create the single data set in Step 1 of the assignment.

* MeanStdOnly - An integer vector used to store the position of all feature descriptions contain the the strings "mean()" or "std()". This positional vector is used as in selecting the only the Mean and Standard deviation variable as a part of Step 2 of the Assignment.

* MeanStdData -  The resulting dataframe created by using select  function from the Dplyr package to create  data set containing subject and test variables along with  the measurements on the mean and standard deviation for each measurement for Step 2 of the Assigment.

* Labels  - A character vector use to store the Descriptive variable names for the measure columns in Step 4 of the Assigment

* TidyData  - a dataframe use to store the independent tidy data set with the average of each variable for each activity and each subject created in Step 5 of the Assigment.
