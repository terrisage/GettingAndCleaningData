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

This section has information about the variables, including units, in the data set not contained in the tidy data.

### Features

Features selected come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). The feature variables were further filtered to the mean and standard deviation variables. The units used are positive and negative floating point numbers. A total of 66 variables were collected

- timebodyaccelerometer-mean-x
- timebodyaccelerometer-mean-y
- timebodyaccelerometer-mean-z
- timebodyaccelerometer-std-dev-x
- timebodyaccelerometer-std-dev-y
- timebodyaccelerometer-std-dev-z
- timegravityaccelerometer-mean-x
- timegravityaccelerometer-mean-y
- timegravityaccelerometer-mean-z
- timegravityaccelerometer-std-dev-x
- timegravityaccelerometer-std-dev-y
- timegravityaccelerometer-std-dev-z
- timebodyaccelerometerjerk-mean-x
- timebodyaccelerometerjerk-mean-y
- timebodyaccelerometerjerk-mean-z
- timebodyaccelerometerjerk-std-dev-x
- timebodyaccelerometerjerk-std-dev-y
- timebodyaccelerometerjerk-std-dev-z
- timebodygyroscope-mean-x
- timebodygyroscope-mean-y
- timebodygyroscope-mean-z
- timebodygyroscope-std-dev-x
- timebodygyroscope-std-dev-y
- timebodygyroscope-std-dev-z
- timebodygyroscopejerk-mean-x
- timebodygyroscopejerk-mean-y
- timebodygyroscopejerk-mean-z
- timebodygyroscopejerk-std-dev-x
- timebodygyroscopejerk-std-dev-y
- timebodygyroscopejerk-std-dev-z
- timebodyaccelerometermagnitude-mean
- timebodyaccelerometermagnitude-std-dev
- timegravityaccelerometermagnitude-mean
- timegravityaccelerometermagnitude-std-dev
- timebodyaccelerometerjerkmagnitude-mean
- timebodyaccelerometerjerkmagnitude-std-dev
- timebodygyroscopemagnitude-mean
- timebodygyroscopemagnitude-std-dev
- timebodygyroscopejerkmagnitude-mean
- timebodygyroscopejerkmagnitude-std-dev
- frequencybodyaccelerometer-mean-x
- frequencybodyaccelerometer-mean-y
- frequencybodyaccelerometer-mean-z
- frequencybodyaccelerometer-std-dev-x
- frequencybodyaccelerometer-std-dev-y
- frequencybodyaccelerometer-std-dev-z
- frequencybodyaccelerometerjerk-mean-x
- frequencybodyaccelerometerjerk-mean-y
- frequencybodyaccelerometerjerk-mean-z
- frequencybodyaccelerometerjerk-std-dev-x
- frequencybodyaccelerometerjerk-std-dev-y
- frequencybodyaccelerometerjerk-std-dev-z
- frequencybodygyroscope-mean-x
- frequencybodygyroscope-mean-y
- frequencybodygyroscope-mean-z
- frequencybodygyroscope-std-dev-x
- frequencybodygyroscope-std-dev-y
- frequencybodygyroscope-std-dev-z
- frequencybodyaccelerometermagnitude-mean
- frequencybodyaccelerometermagnitude-std-dev
- frequencybodybodyaccelerometerjerkmagnitude-mean
- frequencybodybodyaccelerometerjerkmagnitude-std-dev
- frequencybodybodygyroscopemagnitude-mean
- frequencybodybodygyroscopemagnitude-std-dev
- frequencybodybodygyroscopejerkmagnitude-mean
- frequencybodybodygyroscopejerkmagnitude-std-dev


### Activities

Activities collected are inks the class labels, which are represented as a code value from 1 to 6, with their activity name. The activity name is indicated with variable text as denoted below.
- walking
- walking upstairs
- walking dowstairs
- sitting
- standing
- laying down

### Subject ID

Subject identifiers, represented using a numeric, are used to uniquely identify subjects that participated in this study. The values for subect identifiers range from the numeric 1 to 30.



## Summary Choices

This section has information about the summary choices made.

1.	What columns are measurements on the mean and standard deviation? Upon review of features.txt file, there was an open question as to columns are a measurement of the mean and standard deviation. For example, there were columns such as fBodyBodyGyroMag-meanFreq() and fBodyBodyGyroMag-mean(). Choice made was to only include columns that included mean() and std() at the end of the column name. 
2.	What descriptive measurements were collected? Descriptive measures were collected from summarizing the name of feature measurements collected. Descriptors conversion include changing starting t to time, starting f to frequency, std() to std-dev, mean() to mean, body_body to body, acc to accelerometer, gyro to gyroscope, and mag to magnitude.
3.	What descriptive activity names were created? The activity names were converted to lower case with underscores replaced with blanks from the activities file and the laying descriptor was converted to laying down. 
4.	What does the tidy dataset summarization file include? The tidy dataset file is grouped by subject ID and activity with the average (i.e., mean) for every measurement. The following is a snapshot of the tidydata.txt file


ID	activity	measurement	                    mean
1	laying down	timebodyaccelerometer-mean-x	0.22159824394
1	laying down	timebodyaccelerometer-mean-y	-0.0405139534294
1	laying down	timebodyaccelerometer-mean-z	-0.11320355358
