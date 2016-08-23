# getandcleanassignment

This project consists of an R script "run_analysis.R" , this readme file and a codebook "codeBook.md", describing the data .

run_analysis.R takes the 4 samsung  data files as input - the movement readings (file prefixed with x_) , the subjects that each record relates to (files prefixed "subject_"), the activity that each record relates to (files prefixed y_ ) and  the  names of the 561 variables  used in the x_ prefixed files (features.txt) 
There are 2 distinct data sets, test and train, indicated by suffixing the "x_", "y_" and "subject_" files  with "test" or "train"

the script sets the working directory adn initialises some variables to hold the filenames  (you must edit this to match your environment) . a function is called for each data set  that:

1. assigns the variable names in the features file tyo the columns in the x_ data
2. strips out all variables that do not have "std" or "mean" in the name from the x_ data 
3. adds the subject and activity values to each record of the x_data.
4. assigns the appropriate activty description to each record 

The function is called for the test dataset and the train dataset. These are then amalgamated 
