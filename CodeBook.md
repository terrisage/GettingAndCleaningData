# Code Book

Data for this project was obtained from the website and source:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Source of Data: 

Use of this dataset in publications must be acknowledged by referencing the following publication [1].

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


## Study Design

This section contains a thorough description of how the data was collected and processed for this Coursera project assignment.

Data was collected from 30 volunteers between the ages of 19 to 48 wearing a smartphone (Samsung Galaxy S II) on their waist and performing six different types of  activities. Each person performed the following activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). A full description of the data may be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Following steps were used to process the data: 


1. The data was obtained as a download file using the curl method from the URL noted above. Curl is an open source command line tool found on Mac OS and Windows for transferring data with URL syntax including HTTP and HTTPS. See http://curl.haxx.se/ for more information. 
2. The file was unzipped into a local working directory. The following primary data files were used in this assignment:
    - UCI HAR Dataset/features.txt lists all of the features collected and in turn will be used for the column headings. The column headings will be described in the variables section below.
    - UCI HAR Dataset/activity_labels provides a mapping of the numeric (index) to the activity. For example, 1 maps to walking and 2 maps to walking upstairs.
    - UCI HAR Dataset/train/subject_train.txt provides training data on the subject identify who performed the activity for each training sample and range from 1 to 30.
    - UCI HAR Dataset/train/X_train.txt provides data for the training set.
    - UCI HAR Dataset/train/y_train.txt provides training labels for the training set of data, for example, 5 maps to tBodyAcc-std()-Y from the features.txt file.
    - UCI HAR Dataset/test/subject_test.txt provides test data on the subject identified by a numeric who performed the activity for each test data.
    - UCI HAR Dataset/test/X_test.txt provides data for the test set.
    - UCI HAR Dataset/test/y_test.txt provides data test labels for the test set. 
3. Merged the training and test data sets together by reading training and test data from the files using read table and performing rbind. This is performed for: 1. training and test datasets, 2. training and test subjects, 3. training and test labels. Note the labels map to the features dataset, whiich is a list of the variable measurements collected during the study.
4. Extracted the measurements on the mean and standard deviations for each measurement using grep to indentify the index of the variable contained within the table. The functions sub and gsub were used to create descriptive variable names. The summary choices has more information in terms of selection of the variables.
5. Used the gsub and lower case functions to create descriptive activity names to name the activities in the data set.
6. Appropriately labels the data set with descriptive activity names.Then create an aggregation of the datasets.
7. Created a 2nd, independent tidy data set with the average of each variable for each activity and each subject using tidyr and dplyr functions to gather, group by, and summarize data. 
8. Write out the tidy data set to tidydata.txt



## Variables

## Summary Choices
