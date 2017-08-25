Getting and Cleaning Data Course Porject
======================================================================================
This repository is the course project of course"Getting and Cleaning Data" in Coursera. 
The data comes from this website:
[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

One R script is created called `run_analysis.R`, which does the following requirements:

    1.Merges the training and the test sets to create one data set.
    2.Extracts only the measurements on the mean and standard deviation for each measurement.
    3.Uses descriptive activity names to name the activities in the data set
    4.Appropriately labels the data set with descriptive variable names.
    5.From the data set in step 4, creates a second, independent tidy data set with the average
    of each variable for each activity and each subject.

The code book contains all the variables and summaries calculated, along with units, and 
any other relevant information.
The result output of step 5 is in the file averages.txt
