

###GETTING AND CLEANING DATA PROJECT CODEBOOK

This Codebook is a description of Getting and Cleaning Data project. The project name is about collecting (downloading) datasets, cleaning them and analyse it in order to respond to the following questions:

    1.Merging the training and the test sets to create one data set. 
    2.Extracting only the measurements on the mean and standard deviation for each measurement. 
    3.Using descriptive activity names to name the activities in the data set 
    4.Appropriately labeling the data set with descriptive variable names. 
    5.From the data set in step 4, creaings a second, independent tidy data set with the average of each variable for each activity and each subject. 

The data collected come from “Human Activity Recognition Using Smartphones Dataset”

##USED VARIABLES DESCRIPTION

1. trainData_X:
is a data frame of Training set with 7352 observations and 561 variables: 

 
2. testData_X :
represents Test set data frame of 2947 observations andof  561 variables: 
 

3. subjectTrainData : 
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. Data frame with 7352 observations and one variable.

4.trainData_Y : 
represents Training labels. A data frame of 7352 observations and one 1 variable: 

5.subjectTestData
is a data frame containing data from subject_test.txt. A data frame with 2947 observations and 1 variable

6. testData_Y : Test labels
A data frame with 2947 observations and one variable.
 
7. features : List of all features. 
A data frame with 561 observations and 2 variable
 
8. activity_labels : 
Links the class labels with their activity name.
A data frame with 6 observations and 2 variables


The collected dataset summary is represented by the figure found at the following link:
https://class.coursera.org/getdata-007/forum/thread?thread_id=99#post-618

9. wholeData_X :
is a combination of trainData_X and testData_X
A data frame with 10299 observations and 561 variable

10. Mean :
is the mean for every column of wholeData_X dataset

11. SD: 
is the standard deviation of every column of wholeData_X dataset
 
12. MeanSD: 
is the calculation result of wholeData_X indexed at every mean and standard deviation

13. wholeData_Y : 
is a combination of trainData_Y and testData_Y

14. all.activity :
is the bind of columns of wholeData_Y and MeanSD
'data.frame':	10299 obs. of  67 variables: 
 $ Activity                   : chr  "STANDING" "STANDING" "STANDING" "STANDING" ... 
 $ tBodyAcc-mean()-X          : num  0.289 0.278 0.28 0.279 0.277 ... 
 $ tBodyAcc-mean()-Y          : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ... 
 $ tBodyAcc-mean()-Z          : num  -0.133 -0.124 -0.113 -0.123 -0.115 ... 
 $ tGravityAcc-mean()-X       : num  0.963 0.967 0.967 0.968 0.968 ... 
 $ tGravityAcc-mean()-Y       : num  -0.141 -0.142 -0.142 -0.144 -0.149 ... 

15. activity_labels :
are activity of daily living (ADL) that the recorded 30 subjects performed while carrying a waist-mounted smartphone with embedded inertial sensors.
[1] "WALKING"            "WALKING_UPSTAIRS"   "WALKING_DOWNSTAIRS" 
[4] "SITTING"            "STANDING"           "LAYING" 
(referemce: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

16. Subject_all:
is a bind of rows from subjectTrainData data frame and subjectTestData dataframe. 

17. all:
is a bind of columns from Subject_all and all.activity data frames

18. Tidy: 
is an aggreagation of each variable for each activity and each subject
