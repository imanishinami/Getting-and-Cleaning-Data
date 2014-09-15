#Use plyr libary to use ddply
library(plyr)

#read training data
X_Train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_Train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
S_Train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read test data
X_Test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_Test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
S_Test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read lables of activities
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#read column header
features <- read.table("./UCI HAR Dataset/features.txt")
colheading <- features$V2

#assign column header
colnames(X_Train) <- colheading 
colnames(X_Test) <- colheading 

names(Y_Train) <- "Activity"
names(Y_Test) <- "Activity"
names(S_Train) <- "SubjectID"
names(S_Test) <- "SubjectID"

#Step 1: Merges the training and the test sets to create one data set
TrainData = cbind(X_Train, S_Train, Y_Train)
TestData = cbind(X_Test, S_Test, Y_Test)
DataSet = rbind(TrainData,TestData)


#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
expr = "mean|Mean|std|Activity|SubjectID"
TidyData = DataSet[,grep(expr ,names(DataSet),value=TRUE)]

#Step 3: Uses descriptive activity names to name the activities in the data set
TidyData$Activity <- factor(TidyData$Activity, labels = activities$V2)


#Step 4: Appropriately labels the data set with descriptive variable names. (features_info.txt)
newheading=gsub("\\(|\\)" ,"", names(TidyData))
newheading=gsub("Acc" ,"Acceleration", newheading)
newheading=gsub("Mag" ,"Magnitude", newheading)
newheading=gsub("Gyro" ,"Gyroscope", newheading)
newheading=gsub("^t" ,"TimeDomain-", newheading)
newheading=gsub("^f" ,"FrequencyDomain-", newheading)
names(TidyData) <- newheading

#Step 5: From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
ResultData = ddply(TidyData, .(Activity, SubjectID), numcolwise(mean))

write.table(ResultData, file="ResultData.txt", sep="\t") 
