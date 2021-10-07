runAnalysis <- function(){

#Import variable name files
data_labels <- read.table("features.txt", header = FALSE, stringsAsFactors = FALSE, sep = "")
activity_labels <- read.table("activity_labels.txt", sep = "", header = FALSE)

#Import subject and activity data and rename the variables and merge all sets
train_subjects <- read.table("train/subject_train.txt", header = FALSE, sep = "") 
test_subjects <- read.table("test/subject_test.txt", header = FALSE, sep = "")
train_activity <- read.table("train/Y_train.txt", header = FALSE, sep = "")
test_activity <- read.table("test/Y_test.txt", header = FALSE, sep = "")

#merge sets
merged_subjects <- rbind(train_subjects, test_subjects)
merged_activity <- rbind(test_activity, train_activity)

#Import test and train gyroscope data and merge. Add labels to variables.
train_data <- read.table("train/X_train.txt", header = FALSE, sep = "", stringsAsFactors = FALSE)
test_data <-  read.table("test/X_test.txt", header = FALSE, sep = "", stringsAsFactors = FALSE)
merged_data <- rbind(train_data, test_data)
names(merged_data) <- data_labels[,2]

#subset data with mean and standard deviation
merged_data <- merged_data[ grepl("std|mean", names(merged_data), ignore.case = TRUE) ] 

#add descriptive names to movement variable. Merge all datasets.
merged_activity <- merge(merged_activity, activity_labels, by.x = "V1", by.y = "V1")[2]
merged_data <- cbind(merged_subjects, merged_activity, merged_data)
names(merged_data)[1:2] <- c("subject", "activity")

#extract mean data
merged_data%>%
  group_by(subject, activity)%>%
  summarize_each(funs(mean))
  
#write to txt
write.table(head,"head2", row.names = FALSE)


}
