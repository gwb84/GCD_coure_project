# Analysis of Human Activity Recognition Using Smartphones Data Set

# This script:
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject.

# README.MD for an explanation of how the scripts work and how they are connected
# CodeBook.md describes the dataset and any transformations that have been performed on it

# load feature labels as strings
# feature_labels = read.table('/Users/gwb/Rworking/UCI_HAR_Dataset/features.txt',stringsAsFactors = F)
feature_labels = read.table('features.txt',stringsAsFactors = F)
feature_labels = feature_labels[,2] # only need the second column

# make the feature labels more readable (OBJECTIVE 4)
feature_labels = gsub('^t','time',feature_labels)
feature_labels = gsub('^f','freq',feature_labels)
feature_labels = gsub('tBody','timeBody',feature_labels)
feature_labels = gsub('iqr','inter_quartile_range',feature_labels)
feature_labels = gsub('sma','signal_magnitude_area',feature_labels)
feature_labels = gsub('mad','median_absolute_deviation',feature_labels)
feature_labels = gsub('maxInds','max_freq_inds',feature_labels)

# load training set with feature_labels as column names (OBJECTIVE 4)
# X_training_set = read.table('/Users/gwb/Rworking/UCI_HAR_Dataset/train/X_train.txt',col.names=feature_labels)
X_training_set = read.table('X_train.txt',col.names=feature_labels)

# repeat for test set
# X_test_set = read.table('/Users/gwb/Rworking/UCI_HAR_Dataset/test/X_test.txt',col.names=feature_labels)
X_test_set = read.table('X_test.txt',col.names=feature_labels)

# load the training set labels, will be integers in [1,5]
# y_training_labels = read.table('/Users/gwb/Rworking/UCI_HAR_Dataset/train/y_train.txt',col.names=c('activity'))
y_training_labels = read.table('y_train.txt',col.names=c('activity'))

# repeat for test set
# y_test_labels = read.table('/Users/gwb/Rworking/UCI_HAR_Dataset/test/y_test.txt',col.names=c('activity'))
y_test_labels = read.table('y_test.txt',col.names=c('activity'))

# OBJECTIVE 1: COMBINE TRAINING AND TEST DATASETS
X_set = rbind(X_training_set,X_test_set)
dx = dim(X_set)
y_set = rbind(y_training_labels,y_test_labels)
dy = dim(y_set)

# check sizes of X_set and y_set
if (dy[1] != dx[1]) { stop('length of x and y do not match')}

# OBJECTIVE 2: EXTRACT ONLY THE MEANS AND STDS
mean_inds = grep('mean',feature_labels,ignore.case=T)
std_inds = grep('std', feature_labels, ignore.case=T)
X_set_means = X_set[,mean_inds]
X_set_stds = X_set[,std_inds]
# recombine
X_set = cbind(X_set_means,X_set_stds)


# load the activity label strings 
#activity_labels = read.table('/Users/gwb/Rworking/UCI_HAR_Dataset/activity_labels.txt')
activity_labels = read.table('activity_labels.txt')

activity_labels = as.character(activity_labels[,2]) #only need the second column

# OBJECTIVE 3 Name the activities in the data set
# convert to a factor and replace the integer labels with activity label strings
y_set$activity = factor(y_set$activity,ordered = F,labels = activity_labels)

# OBJECTIVE 5 Tidy data set with the average of each variable for each activity and each subject
X_set_names = names(X_set)
nrow = length(activity_labels)
tidy_set = matrix(nrow=nrow,ncol=length(X_set_names))

for (i in 1:length(activity_labels)){
  # find the rows corresponding to the activity
  inds = y_set$activity == activity_labels[i]
  # compute the mean of each measurement for the given activity
  tidy_set[i,] = t(colMeans(X_set[inds,]))
}

# put tidy_set into a data frame with descriptive row and column names
tidy_set = as.data.frame(tidy_set,row.names=activity_labels)
colnames(tidy_set) = X_set_names

#write.csv(tidy_set, file = '/Users/gwb/Rworking/GCD_course_project/X_tidy.csv')
#write.table(tidy_set, file = '/Users/gwb/Rworking/GCD_course_project/X_tidy.txt',row.names = F)
write.table(tidy_set, file = 'X_tidy.txt',row.names = F)



