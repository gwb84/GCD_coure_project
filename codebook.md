# Data Codebook

## Variables Considered in run_analysis.R 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcc-XYZ and timeGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- Features are normalized and bounded within [-1,1]. 
- Each feature vector is a row on the 'X' and 'y' files. 
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/sec2). 
- The gyroscope units are rad/sec.

timeBodyAcc-XYZ  
timeGravityAcc-XYZ  
timeBodyAccJerk-XYZ  
timeBodyGyro-XYZ  
timeBodyGyroJerk-XYZ  
timeBodyAccMag  
timeGravityAccMag  
timeBodyAccJerkMag  
timeBodyGyroMag  
timeBodyGyroJerkMag  
freqBodyAcc-XYZ  
freqBodyAccJerk-XYZ  
freqBodyGyro-XYZ  
freqBodyAccMag  
freqBodyAccJerkMag  
freqBodyGyroMag  
freqBodyGyroJerkMag  

The original data set from UCI contains means and standard deviations derived from these measurements.   
For frequency data, these are weighted averages.  
These variables include 'mean' and 'std' in their names  

Some additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean  
timeBodyAccMean  
timeBodyAccJerkMean  
timeBodyGyroMean  
timeBodyGyroJerkMean  

All variables representing means and standard deviations are extracted in run_analysis.R  
run_analysis.R then computes the mean of each of these variables for each of 6 activities for each of the 30 study participants    

mean: Mean value  
std: Standard deviation  
meanFreq: Weighted average of the frequency components to obtain a mean frequency  


## Activities Considered in run_analysis.R
The measurements were taken when participants were engaged in 1 of 6 activities  
These activities are  

1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  



