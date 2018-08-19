

# Downloading the zip file
# I downloaded and unzipped the package manually

## Loading all the input data
path = "data/UCI HAR Dataset"
subject_test <- read.table(paste0(path, "\\test\\subject_test.txt"))
subject_train <- read.table(paste0(path, "\\train\\subject_train.txt"))

X_test <- read.table(paste0(path, "\\test\\X_test.txt"))
X_train <- read.table(paste0(path, "\\train\\X_train.txt"))

y_test <- read.table(paste0(path, "\\test\\y_test.txt"))
y_train <- read.table(paste0(path, "\\train\\y_train.txt"))

activity_labels <- read.table(paste0(path, "\\activity_labels.txt"))
features <- read.table(paste0(path, "\\features.txt"))


# 1. Merges the training and the test sets to create one data set.
completeSet <- rbind(X_train,X_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

Mstd <- grep("mean()|std()", features[, 2]) 
completeSet <- completeSet[,Mstd]


# 4. Appropriately labels the data set with descriptive activity names.

newNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(completeSet) <- newNames[Mstd]

# combine test and train of subject data and activity data, give descriptive lables

completeSubject <- rbind(subject_train, subject_test)
names(completeSubject) <- 'subject'
activity <- rbind(y_train, y_test)
names(activity) <- 'activity'
completeSet <- cbind(completeSubject,activity, completeSet)


# 3. Uses descriptive activity names to name the activities in the data set

f <- factor(completeSet$activity)
levels(f) <- activity_labels[,2]
completeSet$activity <- f


# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

library("reshape2")

D1 <- melt(completeSet,(id.vars=c("subject","activity")))
D2 <- dcast(D1, subject + activity ~ variable, mean)
names(D2)[-c(1:2)] <- paste("mean" , names(D2)[-c(1:2)] )
write.table(D2, "projectData.txt", sep = ",")
