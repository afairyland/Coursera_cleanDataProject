
## original dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## run_analysis.R performs the following steps and output two tables ##
 0. Read give file.
      * both training and test dataset.
      * subject ID file.
      * activity file.
      * activity ID code file.
 1. merge the training and the test sets to create one data set

 2. Extract only the measurements on the mean an dstandard deviation for each measurement

 3. Uses descriptive activity names to name the activities in the data set

 4. Appropriately labels the data set with descriptive variable names and output resulting table

 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject, and output resulting table.

## output files
 1. subject_activity.txt
      * rows represent subject with certain  activity
      * columns represent features
            The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.. 

            Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

            Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

            These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

            tBodyAcc-XYZ
            tGravityAcc-XYZ
            tBodyAccJerk-XYZ
            tBodyGyro-XYZ
            tBodyGyroJerk-XYZ
            tBodyAccMag
            tGravityAccMag
            tBodyAccJerkMag
            tBodyGyroMag
            tBodyGyroJerkMag
            fBodyAcc-XYZ
            fBodyAccJerk-XYZ
            fBodyGyro-XYZ
            fBodyAccMag
            fBodyAccJerkMag
            fBodyGyroMag
            fBodyGyroJerkMag

            The set of variables that were estimated from these signals are:

            mean(): Mean value
            std(): Standard deviation

 2. per_subject_per_activity_mean.txt
      * rows represent subject with certain  activity
      * columns represent features. These features are the mean of features in output file 1 over subject with certain activity. 

