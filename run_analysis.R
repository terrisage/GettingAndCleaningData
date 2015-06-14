## Project for Getting and Cleaning Data, June 2015 Coursera.
## Assumes user of this script has set working directory and has security permissions required to download and unzip files. 
library(tidyr)
library(dplyr)

## 1. download the file as dataset.zip into the working directory and 2. unzip file
if (!file.exists("dataset.zip")) {
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="dataset.zip", method="curl")
unzip("dataset.zip")
}

## 3. Merge the training and test data to create dataset, subjects, and labels. 
dataset <- rbind(read.table("UCI HAR Dataset/train/X_train.txt"), read.table("UCI HAR Dataset/test/X_test.txt"))
subjects <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt"), read.table("UCI HAR Dataset/test/subject_test.txt"))
labels <- rbind (read.table("UCI HAR Dataset/train/y_train.txt"), read.table("UCI HAR Dataset/test/y_test.txt")) 

## 4. Extract only the measurements on the mean and standard deviation for each measurement.
features <- read.table ("UCI HAR Dataset/features.txt", stringsAsFactor=FALSE)
indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
features <- tolower(features[indices, 2]) %>%
  sub("^t", "time", .) %>%            
  sub("^f", "frequency", .) %>%
  gsub("std\\(\\)", "std-dev", .) %>%
  gsub("mean\\(\\)", "mean", .) %>%
  gsub("body_body", "body", .) %>%
  gsub("acc", "accelerometer", .) %>%  
  gsub("gyro", "gyroscope", .) %>%
  gsub("mag", "magnitude", .)
dataset <- dataset[, indices]
names(dataset) <- features

## 5. Use descriptive activity names to name the activities in the data set.
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[, 2] <- tolower(activities[, 2]) %>%
  gsub("laying", "laying down", .) %>%
  gsub("_", " ", .)

## 6. Appropriately labels the data set with descriptive activity names.
labels[,1] = activities[labels[,1], 2]
names(labels) <- "activity"
names(subjects) <- "ID"
aggregate <- cbind(subjects, labels, dataset)

## 7. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- aggregate %>%
  gather(measurement, value, -ID, -activity) %>%
  group_by(ID, activity, measurement) %>% 
  summarise(mean=mean(value))

write.table(tidydata, "tidydata.txt", sep="\t", eol = "\n", quote=FALSE, row.names=FALSE)
