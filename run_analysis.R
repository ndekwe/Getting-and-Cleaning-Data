
#######################################################################################################
#######################################################################################################
#The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
#The goal is to prepare tidy data that can be used for later analysis. 
#You will be graded by your peers on a series of yes/no questions related to the project. 
#You will be required to submit: 
### 1) a tidy data set as described below, 
### 2) a link to a Github repository with your script for performing the analysis,
### 3) a code book that describes the variables, the data, and any transformations or 
#work that you performed to clean up the data called CodeBook.md. 
#You should also include a README.md in the repo with your scripts. 
#This repo explains how all of the scripts work and how they are connected. 

#One of the most exciting areas in all of data science right now is wearable computing 
#- see for example this article . 
#Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most 
#advanced algorithms to attract new users. 
#The data linked to from the course website represent data collected from the 
#accelerometers from the Samsung Galaxy S smartphone. 
#A full description is available at the site where the data was obtained:

#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Here are the data for the project:

#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#You should create one R script called run_analysis.R that does the following. 

##    Merges the training and the test sets to create one data set.
##    Extracts only the measurements on the mean and standard deviation for each measurement. 
##    Uses descriptive activity names to name the activities in the data set
##    Appropriately labels the data set with descriptive variable names. 

## From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
##############################################################################################3
###########################################################################################3###

## Author: Alexis Ndekwe
########################
########################

#Checking whether required packages are installed(and installing them, in case they are not)

if (!require("data.table")) {
    install.packages("data.table") 
    require("data.table")
 }
if (!require("reshape2")) {
    install.packages("reshape2") 
    require("reshape2")
 }

#Downloading the data
#!!!!!!!!!!!!!!1download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="Data.zip")

# Unzipping the downlaoded .zip file
#!!!!!!!!!!!!file.rename("getdata_projectfiles_UCI HAR Dataset.zip", "getdata_projectfiles_UCI-HAR-Dataset.zip")
#!!!!!!!!!!!!unzip("getdata_projectfiles_UCI-HAR-Dataset.zip",overwrite = TRUE)

#Setting up working environment (Directory rename)
#!!!!!!!!!!!file.rename("UCI HAR Dataset", "UCI-HAR-Dataset")

#!!!!!!!!!!!presentDir <- getwd()
#!!!!!!!!!!!workingDir <- "UCI-HAR-Dataset"
#!!!!!!!!!!!newDir <- paste(presentDir,workingDir,sep ="/")
#!!!!!!!!!!!setwd(newDir)
#colnames("trainData")

### 1###
#Collecting data to be merged
trainData_X <- read.table("./train/X_train.txt")
testData_X <- read.table("./test/X_test.txt")
subjectTrainData <- read.table("./train/subject_train.txt")
trainData_Y <- read.table("./train/y_train.txt")
subjectTestData <- read.table("./test/subject_test.txt")
testData_Y <- read.table("./test/y_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

#Combining test and train data into a bigger data set
wholeData_X <- rbind(trainData_X,testData_X)


###  2. ###
#mean() and std() 
## Extracts only the measurements on the mean and
## standard deviation for each measurement. 
colnames(wholeData_X) <- c(as.character(features[,2]))
Mean<-grep("mean()",colnames(wholeData_X),fixed=TRUE)
SD<-grep("std()",colnames(wholeData_X),fixed=TRUE)
MeanSD<-wholeData_X[,c(Mean,SD)]



### 3 ###
#Using descriptive activity names to name the activities in the data set
wholeData_Y <- rbind(trainData_Y,testData_Y)
all.activity<-cbind(wholeData_Y,MeanSD)
colnames(all.activity)[1] <- "Activity"



### 4 ###
##Adding Appropriately labels the data set with descriptive variable names.
activity_labels[,2]<-as.character(activity_labels[,2])
for(i in 1:length(all.activity[,1]))
   {
     all.activity[i,1]<-activity_labels[all.activity[i,1],2]
   }

##Create the second tidy data set
Subject_all<-rbind(subjectTrainData,subjectTestData)
all<-cbind(Subject_all,all.activity)
colnames(all)[1] <- "Subject"

Tidy <- aggregate( all[,3] ~ Subject+Activity, data = all, FUN= "mean" )
 
 for(i in 4:ncol(all))
    {
        Tidy[,i] <- aggregate( all[,i] ~ Subject+Activity, data = all, FUN= "mean" )[,3]
    } 
colnames(Tidy)[3:ncol(Tidy)] <- colnames(MeanSD)


### 5 ###
##Creating a Tidy data set
write.table(Tidy, row.names = FALSE, file= "projectFinalTidyDataSet.txt")
print("Please run list.files() command to locate 'projectFinalTidyDataSet.txt' file...")
print("The result of tidy data has been output in that file")


#Writing the output to a file
#sink("projectResult.txt")
#print(Tidy)
#sink()
