##0.
##loading all the needed datasets
setwd("E:\\R\\Getting and Cleaning Data\\Human Activity Dataset")
# test set
test_x <- read.table("X_test.txt")
#test labels
test_y <- read.table("Y_test.txt")
#id of testees
test_subject <- read.table("subject_test.txt")
#train set
train_x <- read.table("X_train.txt")
#train label
train_y <- read.table("Y_train.txt")
#trainee's id
train_subject <- read.table("subject_train.txt")
#load feactures, activitylabels
features <- read.table("features.txt")#561 variables name
activity_labels <- read.table("activity_labels.txt")
##give column names for each data set
colnames(trainsubject) <- "sujectid"
colnames(testsubject) <-"sujectid"

colnames(testy) <- "activityid"
colnames(trainy) <-"activityid"

colnames(activitylabels)<-c("activityid","activityname")

##1.
##merging training data and test data into one data set:
mrg_test <-cbind(test_y, test_subject, test_x)
mrg_train <- cbind(train_y, train_subject, train_x)

##2.
##Extracts only the measurements on the mean and standard deviation for each measurement
select_mean_sd <- grep("-mean()|-std()", features[,2])
mrg_test_msd <- mrg_test[, select_mean_sd]
mrg_train_msd <- mrg_test[, select_mean_sd]
##3.
##use descriptive activity names to name the activities in the data

##4.
##assign column's names:
#since I have already given the column names to -y/-x/-subject, the column names of selected data set have also been updated.
##activityid(y) + subjectid(subject) + selected_features' name(x)
col_label <- c("activityId","subjectId",select_mean_sd)
colnames(mrg_test_msd)<- col_label
colnames(mrg_train_msd)<- col_label
##5.
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##combine all test&train data
all_data <- rbind(mrg_test_msd, mrg_train_msd)
average_data <- ddply(all_data, .(subjectid,activityid), mean)
write.table(average_data, "averages_data.txt", row.name=FALSE)
