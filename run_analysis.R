## get the root directory
HomeDir <-getwd()

## Load necessary library files dplyr
library(dplyr)

##
## Read in all data files in for Steps 1 - 5
##

## read in the features file
features <- read.table(file = "features.txt",header = FALSE)

## rename the feature columns with descriptive labels for ease of use in later steps
names(features) <-c("featureID","feature")

## read in the activity_labels file
activity <- read.table(file = "activity_labels.txt",header = FALSE)

## rename the activity columns with descriptive labels for ease of use in later steps
names(activity) <- c("ActivityID","Activity")


## get training dataset tables
setwd("./train")

y_train <- read.table(file = "y_train.txt",header = FALSE)
names(y_train) <- c("ActivityID")

x_train <- read.table(file = "X_train.txt",header = FALSE)
subject_train <- read.table(file = "subject_train.txt",header = FALSE)
names(subject_train) <- c("Subject")


## get test dataset tables
setwd(HomeDir)
setwd("./test")

y_test <- read.table(file = "y_test.txt",header = FALSE)
names(y_test) <- c("ActivityID")

x_test <- read.table(file = "X_test.txt",header = FALSE)
subject_test <- read.table(file = "subject_test.txt",header = FALSE)
names(subject_test) <- c("Subject")
setwd(HomeDir)

##
## Step 1 - Merge the training and the test sets to create one data set.
##

## create two  merge datasets for test and train using column bind
mergedTest <-cbind(subject_test,y_test,x_test)
mergedTrain <-cbind(subject_train,y_train,x_train)

## create one data set from the two merge data sets using row bind
AllData <- rbind(mergedTrain,mergedTest)

##
## Step 2 - Extract only the measurements on the mean and standard deviation for each measurement.
##

## As the feature list contains the a description of the list of measure I use
## grep to check a regular condition against each  value of the vector features$feature to test
## if the value contains mean or std in  string ignoring case. resulting vector of positions when
## this is true is stored in a new variable  MeanStdOnly

MeanStdOnly <-grep("mean[(][)]|std[(][)]",features$feature)

## we then use select on the  combined dataframe AllData from  taking columns 1,2 and variable from MeanStdOnly
## to create a dataframe containing only measures of Mean and Standard

MeanStdData <- select(AllData,1:2,MeanStdOnly+2)

##
## Step 3 - Uses descriptive activity names to name the activities in the data set.
##

## first merge the MeanStdData with the activity dataframe, 
## as the ActivityID label is common to both only the Activity column will be
## added to the end of MeanStdData

MeanStdData <- merge(MeanStdData,activity)

## The mutate function is used to replace the ACtivityID with description
## in the activity field
MeanStdData <- mutate(MeanStdData,ActivityID = Activity)

## we use the select statement to remove the Activity column from the  
## dataframe
MeanStdData <- select(MeanStdData, -Activity)

## As the data inhe ActivityID field is now a description and no longer an
## ID, the field is renamed activity.
MeanStdData <- rename(MeanStdData, Activity = ActivityID)

##
## Step 4 - Appropriately labels the data set with descriptive variable names. 
##

## The features data frame contains a descriptive names for all the variable. As such I used the subset of
## the names that that contained only mean and std to obtain the descripts as a vector. To that i added the name
## Activity and subjects which come directly before the variables and rename all the columns in the dataframe.

Labels <-as.vector(features$feature[MeanStdOnly])

Labels <-sub('BodyBody','Body',Labels)
Labels <-sub('fBody','FrequencyBody',Labels)
Labels <-sub('tBody','TimeBody',Labels)
Labels <-sub('tGravity','TimeGravity',Labels)
Labels <-sub('Acc','Accelerometer',Labels)
Labels <-sub('Gyro','Gyroscope',Labels)
Labels <-sub('Mag','Magnitude',Labels)
Labels <-sub('mean[(][)]','MeanValue',Labels)
Labels <-sub('std[(][)]','StandardDeviation',Labels)
Labels <-sub('-','',Labels)
Labels <-sub('-X','X',Labels)
Labels <-sub('-Y','Y',Labels)
Labels <-sub('-Z','Z',Labels)

names(MeanStdData) <- c("Activity","Subject",as.vector(Labels))

##
## Step 5 - From the dataset in step 4, creates a second, independent tidy data 
##          set with the average of each variable for each activity and each subject.
##

TidyData <- MeanStdData %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))