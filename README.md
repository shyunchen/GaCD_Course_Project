# README.md

To transform raw data into tidy data:

* (01) Load the testing data (Data, Subject & Activity) from your working directory
* (02) Load the training data (Data, Subject & Activity) from your working directory
* (03) Combine the testing Subject & Activity information into testing data set
* (04) Combine the training Subject & Activity information into training data set
* (05) Merge the training and the testing data sets into one complete data set
* (06) Load features (variables) description
* (07) Label the complete data set with descriptive variable names from above step
* (08) Use descriptive activity names to name the activities in the data set (instead of just numbers from 1 to 6)
* (09) Add "Subject" & "Activity" to the beginning of features data set
* (10) Extract columns that its name contains the following values : "Subject|Activity|mean|std|Mean" from features data set
* (11) Extract only the measurements on the mean and standard deviation for each measurement into the first tidy data set
* (12) Load reshape2 library
* (13) Use melt() function to create the second tidy long data set
* (14) Use dcast() function to create the third tidy wide data set
* (15) Write the third tidy wide data set to local file "tidydata.txt"



