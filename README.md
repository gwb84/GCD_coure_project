# GCD_course_project
Getting and Cleaning Data Course Project

## Analysis files
### run_analysis.R

This file loads data from a local directory and outputs a tidy data set.
Briefly, the dataset is sensor data from a smart phone from people who were doing one of six activies, e.g. sitting, walking, running...  

The original data set is described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
The original data set may be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The training X and test X data sets are combined, as are the training y and test y data sets  
Variables names are cleaned to be more readable  
A subset of the combined X data is taken that only includes the measurement means and standard deviations  

The y data set is converted from level numbers to activity descriptions  

For each of the six activities, the expected values of the measurement means and standard deviations are computed for each of the 30 study participants    
These results are stored in a data frame with descriptive row and column names. The resulting tidy data is saved to a .txt file called X_tidy.txt

### X_tidy.txt

This is the tidy data output file





