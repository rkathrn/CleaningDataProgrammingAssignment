##loading libraries
        library(dplyr)
        
##downloading and unzipping data
       
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
        unzip("UCI HAR Dataset.zip")
        
##reading data into R
        testdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
        traindata <- read.table("./UCI HAR Dataset/train/X_train.txt")
        testactivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
        trainactivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
        testsubj <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        trainsubj <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        features <- read.table("./UCI HAR Dataset/features.txt")

##defining column/variable names for datasets when combined
        measure_names <- as.character(features$V2)
        logistic_names <- c("Subject", "Activity")
        all_names <- c(logistic_names, measure_names)

##binding test data to a dataframe
        dummy <- cbind(testsubj, testactivity)
        dummy <- cbind(dummy, testdata)
        names(dummy) <- all_names

##binding train data to a dataframe
        dummy2 <- cbind(trainsubj, trainactivity)
        dummy2 <- cbind(dummy2, traindata)
        names(dummy2) <- all_names

##combining test and train dataframes into one
        masterdum <- rbind(dummy, dummy2)

##extracting columns containing mean and standard deviation only
        smaller <- masterdum[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)]

##removing the clutter items
        rm(testdata)
        rm(traindata)
        rm(testactivity)
        rm(trainactivity)
        rm(testsubj)
        rm(trainsubj)
        rm(measure_names)
        rm(logistic_names)
        rm(features)
        rm(all_names)
        rm(dummy)
        rm(dummy2)
        rm(masterdum)
        
##giving Activity variable descriptive names instead of numbers
        smaller$Activity <- gsub("1", "Walking", smaller$Activity)
        smaller$Activity <- gsub("2", "Walking Upstairs", smaller$Activity)
        smaller$Activity <- gsub("3", "Walking Downstairs", smaller$Activity)
        smaller$Activity <- gsub("4", "Sitting", smaller$Activity)
        smaller$Activity <- gsub("5", "Standing", smaller$Activity)
        smaller$Activity <- gsub("6", "Laying", smaller$Activity)

##renaming variables to something slightly more descriptive
        names(smaller) <- gsub("Acc", ".Acc", names(smaller))
        names(smaller) <- gsub("-mean()", ".Mean", names(smaller))
        names(smaller) <- gsub("-std()", ".StdDeviation", names(smaller))
        names(smaller) <- gsub("tBody", "Time.Body", names(smaller))
        names(smaller) <- gsub("Jerk", ".Jerk", names(smaller))
        names(smaller) <- gsub("fBody", "Freq.Body", names(smaller))
        names(smaller) <- gsub("BodyBody", "Body", names(smaller))
        names(smaller) <- gsub("Mag", ".Magnitude", names(smaller))
        names(smaller) <- gsub("tGravity", "Time.Gravity", names(smaller))
        names(smaller) <- gsub("Gyro", ".Gyro", names(smaller))
        
##creating tidy dataset with only averages for each subject and activity
        tidy <- smaller %>% group_by(Subject, Activity) %>% summarize_all(mean)
        rm(smaller)
        head(tidy)
        
##write tidy dataset out of R
        write.table(tidy, file = "tidydata.txt", sep="", row.name = FALSE)