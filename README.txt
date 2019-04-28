==================================================================
Coursera Getting & Cleaning Data Week 4 Programming Assignment — Rachel Stainer
==================================================================
Using data supplied by:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

About the Data (from the Study Authors, edited):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The original dataset was been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. In this repository, both have been combined into one dataset.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


For each record it is provided:
======================================

- Subject                                     
- Activity                                    
- Time.Body.Acc.Mean()-X                      
- Time.Body.Acc.Mean()-Y                      
- Time.Body.Acc.Mean()-Z                      
- Time.Body.Acc.StdDeviation()-X             
- Time.Body.Acc.StdDeviation()-Y             
- Time.Body.Acc.StdDeviation()-Z              
- Gravity.Acc.Mean()-X                        
- Gravity.Acc.Mean()-Y                        
- Gravity.Acc.Mean()-Z                        
- Gravity.Acc.StdDeviation()-X                
- Gravity.Acc.StdDeviation()-Y                
- Gravity.Acc.StdDeviation()-Z                
- Time.Body.Acc.Jerk.Mean()-X                 
- Time.Body.Acc.Jerk.Mean()-Y                 
- Time.Body.Acc.Jerk.Mean()-Z                 
- Time.Body.Acc.Jerk.StdDeviation()-X         
- Time.Body.Acc.Jerk.StdDeviation()-Y         
- Time.Body.Acc.Jerk.StdDeviation()-Z         
- Time.Body.Gyro.Mean()-X                     
- Time.Body.Gyro.Mean()-Y                     
- Time.Body.Gyro.Mean()-Z                     
- Time.Body.Gyro.StdDeviation()-X             
- Time.Body.Gyro.StdDeviation()-Y             
- Time.Body.Gyro.StdDeviation()-Z             
- Time.Body.Gyro.Jerk.Mean()-X                
- Time.Body.Gyro.Jerk.Mean()-Y                
- Time.Body.Gyro.Jerk.Mean()-Z                
- Time.Body.Gyro.Jerk.StdDeviation()-X        
- Time.Body.Gyro.Jerk.StdDeviation()-Y        
- Time.Body.Gyro.Jerk.StdDeviation()-Z        
- Time.Body.Acc.Magnitude.Mean()              
- Time.Body.Acc.Magnitude.StdDeviation()      
- Gravity.Acc.Magnitude.Mean()                
- Gravity.Acc.Magnitude.StdDeviation()        
- Time.Body.Acc.Jerk.Magnitude.Mean()         
- Time.Body.Acc.Jerk.Magnitude.StdDeviation() 
- Time.Body.Gyro.Magnitude.Mean()             
- Time.Body.Gyro.Magnitude.StdDeviation()     
- Time.Body.Gyro.Jerk.Magnitude.Mean()        
- Time.Body.Gyro.Jerk.Magnitude.StdDeviation()
- Freq.Body.Acc.Mean()-X                      
- Freq.Body.Acc.Mean()-Y                      
- Freq.Body.Acc.Mean()-Z                      
- Freq.Body.Acc.StdDeviation()-X              
- Freq.Body.Acc.StdDeviation()-Y              
- Freq.Body.Acc.StdDeviation()-Z              
- Freq.Body.Acc.Jerk.Mean()-X                 
- Freq.Body.Acc.Jerk.Mean()-Y                 
- Freq.Body.Acc.Jerk.Mean()-Z                 
- Freq.Body.Acc.Jerk.StdDeviation()-X         
- Freq.Body.Acc.Jerk.StdDeviation()-Y         
- Freq.Body.Acc.Jerk.StdDeviation()-Z         
- Freq.Body.Gyro.Mean()-X                     
- Freq.Body.Gyro.Mean()-Y                     
- Freq.Body.Gyro.Mean()-Z                     
- Freq.Body.Gyro.StdDeviation()-X             
- Freq.Body.Gyro.StdDeviation()-Y             
- Freq.Body.Gyro.StdDeviation()-Z             
- Freq.Body.Acc.Magnitude.Mean()             
- Freq.Body.Acc.Magnitude.StdDeviation()      
- Freq.Body.Acc.Jerk.Magnitude.Mean()         
- Freq.Body.Acc.Jerk.Magnitude.StdDeviation() 
- Freq.Body.Gyro.Magnitude.Mean()             
- Freq.Body.Gyro.Magnitude.StdDeviation()    
- Freq.Body.Gyro.Jerk.Magnitude.Mean()        
- Freq.Body.Gyro.Jerk.Magnitude.StdDeviation()


The dataset includes the following files:
=========================================

- ‘README.txt’

- ‘CodeBook.txt’

- ‘run_analysis.R’ : R script modifying the contents of this repo into a combined, tidy dataset, through the following steps:

	1. downloading the full .zip dataset and unzipping the file into the working directory

	2. reading the data in disparate txt files (subject ID, activity description, raw signals) into corresponding R objects using read.table()

	3. creating character string for the combined dataset (including Subject ID and Activity Label as well as the calculated data already labeled)

	4. using cbind() to bind the subject ID, activity, and calculations into datasets corresponding to the train and test sets, and renaming the columns

	5. using rbind() to combine the amalgamated test and train data frames into a comprehensive single data frame 

	6. using subsetting functionality to extract only the columns that identify subject, activity, and the mean and standard deviation calculations for each measurement

	7. for clarity's sake, using rm() on the r objects storing the incremental stages of the process -- e.g. the original set of r objects, the separate train and test data frames, and the un-subsetted master data frame -- leaving only the version with the mean and standard deviation variables

	8. using gsub() to apply more descriptive activity names for each observation, as well as more descriptive/legible variable names

	9.using group_by() and summarize_all() functions together to create tidy dataset that includes average for each activity (of six) as performed by each individual subject (coming out to 180 observations/rows

	10. using rm() again to delete the r object with untidy data

	11. using write.table() to export the 'tidy' data frame into a txt file in the working directory called 'tidydata.txt'



Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

