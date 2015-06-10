# Getting And Cleaning Data Programming Assignment

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to 
prepare tidy data that can be used for later analysis. The theme of this project is the data collected from wearable 
computing such as Fitbit and Jawbone up. The data linked for this project represents the data collected from a 
Samsung Galaxy accelerometer. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This Github repository contains: 
1. Readme file named README.md which is this file describing the purpose and contents of the repository,
2. R Programming script named run_analysis.R for running in RStudio,
2. Tidy dataset named tidydata.txt with the average of each variable for each activity and each subject, and
3. Codebook named CodeBook.md which describes the complete list of all the data, showing the name of each variable, the values the variable takes, and a description of how that variable is operationalized.  

Two files, run_analysis.R and Codebook.md are described in more detail below.

# run_analysis.R

The script was implemented in RStudio on a MacBook Air running OS X Yosemite. The MacBook Air has 1.7 GHz Intel Core i7 processor, 8 GB of 1600 MHz DDR3 memory, and version 10.10.3 OS X. The script took about 3 minutes to run on that MacBook. The script has not been tested in other enviroments or with other configurations. 

This script: 
1. Prepares directories for download of file from the URL noted above.
2. Unzips file. 
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names. 
7. From the data set, creates a second, independent tidy data set file named tidydata.txt with the average of each variable for each activity and each subject.


# CodeBook.md

The CodeBook contains information about the original dataset, variables (including units) in the data, information about summary choices, and information about the experimental study design used. 

