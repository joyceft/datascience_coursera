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
colnames(train_subject) <- "sujectid"
colnames(test_subject) <-"sujectid"

colnames(test_y) <- "activityid"
colnames(train_y) <-"activityid"

colnames(activity_labels)<-c("activityid","activityname")

##1.
##merging training data and test data into one data set:
mrg_test <-cbind(test_y, test_subject, test_x)
mrg_train <- cbind(train_y, train_subject, train_x)
all_data <- rbind(mrg_test, mrg_train)
##2.
##Extracts only the measurements on the mean and standard deviation for each measurement
select_mean_sd <- grep("-mean()|-std()", features[,2]) + 2
#since the feature starts from the 3rd col(1st is activityid, 2nd is subject id)
#add 2 to the index of selexct_mean_sd
mrg_test_msd <- mrg_test[, c(1,2,select_mean_sd)]
mrg_train_msd <- mrg_train[, c(1,2,select_mean_sd)]
##3.
##use descriptive activity names to name the activities in the data
##already named before
##4.
##assign column's names:
#since I have already given the column names to -y/-x/-subject, the column names of selected data set have also been updated.
##activityid(y) + subjectid(subject) + selected_features' name(x)
#change the class of features into character, in that case, it will be combined with "activityId" and "subjectId"
col_label <- c("activityId","subjectId",as.character(features[select_mean_sd,2]))
colnames(mrg_test_msd)<- col_label
colnames(mrg_train_msd)<- col_label
##5.
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##combine all test&train data
all_data <- rbind(mrg_test_msd, mrg_train_msd)
#set activity as factor, not just id anymore.
all_data$activityId <- factor(all_data$activityId, levels = activity_labels[,1], labels = activity_labels[,2])
average_data <- ddply(all_data, .(activityId, subjectId), ave = mean(all_data[, 3:81]))
# choose from col 3 to col 81, since the first 2 col is activityId and subjectId
write.table(average_data, "averages.txt", row.name=FALSE)


