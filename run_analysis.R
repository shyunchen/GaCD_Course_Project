run_analysis <- function() {

    ## Loading testing data from working directory
    testdata     <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
    testsubject  <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
    testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

    ## Loading training data from working directory
    traindata     <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
    trainsubject  <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
    trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

    ## Combining testing Subject & Activity information into testing data frame
    testdata <- cbind(testsubject, testactivity, testdata)

    ## Combining training Subject & Activity information into training data frame
    traindata <- cbind(trainsubject, trainactivity, traindata)

    ## (Step 1) Merges the training and the testing sets to create one data set
    alldata <- rbind(testdata, traindata)

    ## Getting features/variables description
    features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

    ## (Step 4) Appropriately labels the data set with descriptive variable names
    colnames(alldata) <- c("Subject", "Activity", as.character(features$V2))
    
    ## (Step 3) Uses descriptive activity names to name the activities in the data set
    alldata$Activity <- ifelse((alldata$Activity == 1), "WALKING",            alldata$Activity)
    alldata$Activity <- ifelse((alldata$Activity == 2), "WALKING_UPSTAIRS",   alldata$Activity)
    alldata$Activity <- ifelse((alldata$Activity == 3), "WALKING_DOWNSTAIRS", alldata$Activity)
    alldata$Activity <- ifelse((alldata$Activity == 4), "SITTING",            alldata$Activity)
    alldata$Activity <- ifelse((alldata$Activity == 5), "STANDING",           alldata$Activity)
    alldata$Activity <- ifelse((alldata$Activity == 6), "LAYING",             alldata$Activity)
    
    ## Adding "Subject" & "Activity" to the beginning of features data set
    x <- data.frame(V1 = c(0), V2 = c('Activity'))
    y <- data.frame(V1 = c(0), V2 = c('Subject'))
    features <- rbind(x, features)
    features <- rbind(y, features)
    
    ## Extract columns that its name contains the following values : "Subject|Activity|mean|std|Mean"
    keepfeatures <- grep("Subject|Activity|mean|std|Mean", features$V2)

    ## (Step 2) Extracts only the measurements on the mean and standard deviation for each measurement
    ## This is the tidy data set
    tidydata <- alldata[, keepfeatures]
    
    ## Load reshape2
    library(reshape2)

    ## tidy long data set
    tidylong <- melt(tidydata, id = c("Subject", "Activity"))
    
    ## (Step 5) tidy wide data set
    tidywide <- dcast(tidylong, Subject + Activity ~ variable, mean)
    
    ## Write the tidy wide data set to local file "tidydata.txt"
    write.table(tidywide, file="tidydata.txt", row.name=FALSE)
    
    ## Return
    result <- "Success"
}
