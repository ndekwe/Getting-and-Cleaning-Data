## Getting and Cleaning Data Course Project

Project topic:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

    -Merges the training and the test sets to create one data set.
    -Extracts only the measurements on the mean and standard deviation for each measurement. 
    -Uses descriptive activity names to name the activities in the data set
    -Appropriately labels the data set with descriptive variable names. 
    -From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


## SCRIPT EXECUTION NOTES
This release has three main files which are: 
       1.Codebook.md describing the variables, the data, and the work performed to clean up the data
       2.run_analysis.R which is the script to generate the downloaded datasets into tidy data
       3.and the present README.md file 

Since this script does not include commands to download datasets, make sure you download them, 
unzip them before executing run_analysis.R.

To have an expected result, please set the working directory as UCI-HAR-Dataset and place run_analysis.R 
file under it and run the following command:
source("run_analysis.R") 

This script first check whether "data.table" and "reshape2" packages are installed. 
If they are not installed, the script will  install them.

During the first step, the script reads datasets and store them accordingly. 
The way they are stored is explained in the Codebook.md
In the second step, the mean and standard deviation for each measurement are calculated.

In the third step, descriptive activity is used to name the activities in the data set.
Then labels are added appropriately with descriptive variables.
Finally, the data set is cleaned and transformed to a tidy data set.

The final output result is written in projectFinalTidyDataSet.txt file.

