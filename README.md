The runAnalysis function extracts user data from Samsung telephone accelerometers and creates a tidy data file with the mean per activity per user.
1.Data labels and activity labels are created from the features and activity_labels txt files, respectively.
2.User training and test information is imported from the subject_train and subject_test txt files, respectively.
3.Movement information from training and test are imported from the Y_train and Y_test txt files, respectively.
4.The subject test and train files are merged, and the activity test and train files are merged.
5.Gyroscope test and train data are imported from X_test and X_train txt files, respectively.
6.Gyroscope training data and test data are merged using rbind, and data labels are applied.
7.Mean and standard deviation for each variable is calculated for each activity and user.
8.Activity labels are applied and gyroscope data is merged with the user and activity information.
9.Subject and activity columns are named.
Data is extracted to a new dataset called "head" and this is saved as a .csv file.
