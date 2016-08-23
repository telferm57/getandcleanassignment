The code in this prject transforms data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

the data is supplied in 3 datsets - one that provides data common to the other two , a list of features (i.e. datapoints collected and/or calculated - 561 in total for each measurement) along with a codebook describing them (I  will not repeat that info here), and an "activity Label" file that contains the label for each activity code (e.g. 1 ="WALKING", 2="WALKING_UPSTAIRS"....) 

The other 2 datsets have the same structure and consist of the following files:  
  1. a subject file containing the subject (a person performing the test) that each measurement pertains to
  2. An activity file that contains the activity code (one of 6 possible activites) for each measurement 
  3. A data file containing the measurements  (several thousand) 
  4.

The 2 datasets cover diferent sets of subjects and are referred to as "Test" and "Train" 

These files are amalgamated into one file containing all subjects and with the subjects and activities included in each measurement rather than as separate files. Of the 561 variables, only those 79 relating to standard deviation and mean are retained. They are grouped by subject and activity and the mean for each variable is calculated. The names are the same as the corresponding values in the original data, but with special characters removed and suffixed by _groupmean. 

Full list of variables: 

subject           - the subject number to which the measurement pertains 
activitydesc      - description of activity 
tBodyAccmeanX_groupmean - mean of the  tBodyAcc-mean()-X values for this subject and activty -  see Samsung codebook for meaning of tBodyAcc-mean()-X

tBodyAccmeanY_groupmean - see above 
> tBodyAccmeanZ_groupmean
> tBodyAccstdX_groupmean
> tBodyAccstdY_groupmean
> tBodyAccstdZ_groupmean
tGravityAccmeanX_groupmean
tGravityAccmeanY_groupmean
tGravityAccmeanZ_groupmean
tGravityAccstdX_groupmean
tGravityAccstdY_groupmean
tGravityAccstdZ_groupmean
tBodyAccJerkmeanX_groupmean
tBodyAccJerkmeanY_groupmean
tBodyAccJerkmeanZ_groupmean
tBodyAccJerkstdX_groupmean
tBodyAccJerkstdY_groupmean
tBodyAccJerkstdZ_groupmean
tBodyGyromeanX_groupmean
tBodyGyromeanY_groupmean
tBodyGyromeanZ_groupmean
tBodyGyrostdX_groupmean
tBodyGyrostdY_groupmean
tBodyGyrostdZ_groupmean
tBodyGyroJerkmeanX_groupmean
tBodyGyroJerkmeanY_groupmean
tBodyGyroJerkmeanZ_groupmean
tBodyGyroJerkstdX_groupmean
tBodyGyroJerkstdY_groupmean
tBodyGyroJerkstdZ_groupmean
tBodyAccMagmean_groupmean
tBodyAccMagstd_groupmean
tGravityAccMagmean_groupmean
tGravityAccMagstd_groupmean
tBodyAccJerkMagmean_groupmean
tBodyAccJerkMagstd_groupmean
tBodyGyroMagmean_groupmean
tBodyGyroMagstd_groupmean
tBodyGyroJerkMagmean_groupmean
tBodyGyroJerkMagstd_groupmean
fBodyAccmeanX_groupmean
fBodyAccmeanY_groupmean
fBodyAccmeanZ_groupmean
fBodyAccstdX_groupmean
fBodyAccstdY_groupmean
fBodyAccstdZ_groupmean
fBodyAccmeanFreqX_groupmean
fBodyAccmeanFreqY_groupmean
fBodyAccmeanFreqZ_groupmean
fBodyAccJerkmeanX_groupmean
fBodyAccJerkmeanY_groupmean
fBodyAccJerkmeanZ_groupmean
fBodyAccJerkstdX_groupmean
fBodyAccJerkstdY_groupmean
fBodyAccJerkstdZ_groupmean
fBodyAccJerkmeanFreqX_groupmean
fBodyAccJerkmeanFreqY_groupmean
fBodyAccJerkmeanFreqZ_groupmean
fBodyGyromeanX_groupmean
fBodyGyromeanY_groupmean
fBodyGyromeanZ_groupmean
fBodyGyrostdX_groupmean
fBodyGyrostdY_groupmean
fBodyGyrostdZ_groupmean
fBodyGyromeanFreqX_groupmean
fBodyGyromeanFreqY_groupmean
fBodyGyromeanFreqZ_groupmean
fBodyAccMagmean_groupmean
fBodyAccMagstd_groupmean
fBodyAccMagmeanFreq_groupmean
fBodyBodyAccJerkMagmean_groupmean
fBodyBodyAccJerkMagstd_groupmean
fBodyBodyAccJerkMagmeanFreq_groupmean
fBodyBodyGyroMagmean_groupmean
fBodyBodyGyroMagstd_groupmean
fBodyBodyGyroMagmeanFreq_groupmean
fBodyBodyGyroJerkMagmean_groupmean
fBodyBodyGyroJerkMagstd_groupmean
fBodyBodyGyroJerkMagmeanFreq_groupmean
