
library(dplyr)
library(tidyr)

source("my_functions.R")

unzip('./getdata-projectfiles-UCI HAR Dataset.zip')

activity_df <- read.table('./UCI HAR Dataset/activity_labels.txt')
names(activity_df) <- c("activityid", "activity")

feature_df <- read.table('./UCI HAR Dataset/features.txt')

X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')

X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

features <- feature_df[, 2]
names(X_train) <- features
names(X_test) <- features
rm(feature_df, features)

names(y_train) <- "activityid"
names(y_test) <- "activityid"

names(subject_train) <- "subject"
names(subject_test) <- "subject"

mydf <- rbind_list(
    cbind(X_train, y_train, subject_train), 
    cbind(X_test, y_test, subject_test))

mydf <- merge(mydf, activity_df)

rm(X_train, y_train, subject_train, X_test, y_test, subject_test, activity_df)

tbl_df(mydf) %>%
    select(matches("\\-mean\\()", ignore.case = FALSE), 
           matches("\\-std\\()", ignore.case = FALSE), 
           activity, subject) %>%
    gather(variable, value, -c(subject,activity)) %>%
    mutate(variable = change.featurename(variable)) %>%
    group_by(subject, activity, variable) %>%
    summarize(average = mean(value)) %>%
    write.table(file = "tidy-data.txt", row.names = FALSE)
