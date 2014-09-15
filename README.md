Getting-and-Cleaning-Data
=========================

##Process of the script<BR><BR>

###Preparation Step 0: <BR>
-Use plyr libary to use ddply <BR>
-read training data<BR>
-read test data<BR>
-read lables of activities<BR>
-read column header<BR>
-assign column header<BR>
<BR>
###Step 1: Merges the training and the test sets to create one data set (Variable:DataSet)<BR>
<BR>
###Step 2: Extracts only the measurements (Variable: expr) on the mean and standard deviation for each measurement. And extract data into variable called TidtData<BR>
<BR>
###Step 3: Uses descriptive activity names to name the activities in the data set<BR>
<BR>
###Step 4: Appropriately labels the data set with descriptive variable names. Refer to features_info.txt<BR>
        e.g.  <BR>
              Acc --> Acceleration<BR>
              Mag --> Magnitude<BR>
              Gyro -->  Gyroscope<BR>
              prefix 't' --> Time Domain<BR>
              prefix 'f' --> Frequency Domain<BR>
<BR>
###Step 5: From the data set in step 4, creates a second, independent tidy data set (called ResultData) with the average of each variable for each activity and each subject.<BR>
<BR>
###Step 6: Export data into "ResultData.txt" <BR>
<BR>

##What the analysis file did<BR><BR>
It generate average of every features for each activity and subject pair.
