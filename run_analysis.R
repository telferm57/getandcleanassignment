# set wd 
assignmentPath <- "F://Datascience//coursera//getandclean/project"

setwd(assignmentPath)

# define the files 

testsubfile <- ".//subject_test.txt"
testxfile <- ".//x_test.txt"
testyfile <- ".//y_test.txt"
featfile <- ".//features.txt"
activitiesfile <- ".//activity_labels.txt"
trainsubfile <- ".//subject_train.txt"
trainxfile <- ".//x_train.txt"
trainyfile <- ".//y_train.txt"
outputfile <- ".//meanbysubjectactivity.txt"

# load libraries 

library(dplyr)
#####################################################################################################################
#  F U N C T I O N S 
#####################################################################################################################

fnmanipulate <- function(fnx,fny,fnsub,nv,desirednames,activities) { 
  
  ## transform the files - 
  # fnx - the file containing movement data with no colnames and all variables  
  # fny - the file containing numeric list of activities 
  # fnsub - the file containing the list of subjects , 1 for each activity and set of readings 
  # nv - vector of names of all variables in fnx 
  # desired names - vector of position of desired names of variabkles to be selected from fnx
  # activities - list of activity descriptions 
  # possible tests : length fnx = length fny = length of fnsub
  #               : length of nv = number of cols in fnx 
  
  message("Processing file: ",fnx)
  
  
  tstx <- read.table(fnx,stringsAsFactors = FALSE)     # get the  data 
  colnames(tstx) <- nv       # push names from feature file
  
  tstx2 <- tstx[,desirednames]   ## select only columns that are in the 'desired names' 
  
  colnames(tstx2) <- gsub("\\(|\\)|\\-","",names(tstx2)) # pretty up the names 
  
  tstx2 <- tbl_df(tstx2) 
  # 2 add the subjects 
  subjects <- read.table(fnsub,stringsAsFactors = FALSE)
  colnames(subjects) <- "subject"
  message("number of subjects in this file: ",n_distinct(subjects$subject))
  tstx2 <- bind_cols(subjects,tstx2)
  
  # 3 add descriptive activity  to code in y_test - add column to fny containing activity description 
  
  
  act_num <- read.table(fny)   # read  list of activitiy codes 
  act_num <- as_data_frame(act_num)   # tblise it
  
  act_num$actname <- activities[,2][act_num$V1] # add new column with appropriate name 
  colnames(act_num) <- c("activitycode","activitydesc")
  #bind the activities to the main table, tstx2
  message("nrows tstx2:",nrow(tstx2),"nrows act_num:",nrow(act_num))
  tstx2 <- bind_cols(act_num,tstx2)
  
  
}
###############################################################################################################

#manipulate test data 


# 1 remove all non mean and std columns

#1.1 create vector of features 

x_names <- read.table(featfile,stringsAsFactors = FALSE)


# convert  all the names to a vector 

namesvec <- x_names[,2]
dnames <- grep(".*std\\(|.*mean\\(|.*meanFreq",namesvec)  # find index of those with std or mean or mean frequency - we will pass this to the file manipulatioo funtion  

activities <- read.fwf(activitiesfile,c(2,19),stringsAsFactors=FALSE) # get the activity names 

## message("manipulate test data ")
testdata <- fnmanipulate(testxfile,testyfile,testsubfile,namesvec,dnames,activities)

## message("manipulate train data ")

traindata <- fnmanipulate(trainxfile,trainyfile,trainsubfile,namesvec,dnames,activities)

## message("join test and train data ")

combineddata<-bind_rows(testdata,traindata)

message("variable combineddata contains the cleaned test and train data ")

groupedsubact <- group_by(combineddata,subject,activitydesc)

summarisedbysubjectandactivity <- summarise_each(groupedsubact,funs(groupmean = mean(.)),-activitycode)

message("variable summarisedbysubjectandactivity contains the data summarised by activity within subject ")

groupedsub <- group_by(combineddata,subject)

# removed activitydesc and subject - averages meaningless or NA 
summarisedbysubject <- summarise_each(groupedsub,funs(persubject = mean(.)),-subject,-activitydesc)

message("variable summarisedbysubject contains the data summarised by  subject ")


groupedact <- group_by(combineddata,activitydesc)

summarisedbyactivity <- summarise_each(groupedact,funs(peractivity = mean(.)))
message("variable summarisedbyactivity contains the data summarised by activity ")
write.table(summarisedbysubjectandactivity,file=outputfile,row.names = FALSE)

message("The data summarised by activity within subject has been written to ",outputfile)







