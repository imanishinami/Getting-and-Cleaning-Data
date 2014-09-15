Getting-and-Cleaning-Data
=========================

Preparation Step 0: 
-Use plyr libary to use ddply
-read training data
-read test data
-read lables of activities
-read column header
-assign column header

Step 1: Merges the training and the test sets to create one data set (Variable:DataSet)

Step 2: Extracts only the measurements (Variable: expr) on the mean and standard deviation for each measurement.
And extract data into variable called TidtData

Step 3: Uses descriptive activity names to name the activities in the data set

Step 4: Appropriately labels the data set with descriptive variable names. 
        Refer to features_info.txt
        e.g.  Acc --> Acceleration
              Mag --> Magnitude
              Gyro -->  Gyroscope
              prefix 't' --> Time Domain
              prefix 'f' --> Frequency Domain

Step 5: From the data set in step 4, creates a second, independent tidy data set (called ResultData)
with the average of each variable for each activity and each subject.

Step 6: Export data into "ResultData.txt" 
