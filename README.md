Getting and Cleaning Data - Project:

Loaded necessary libraries and source scripts.
Assuming `getdata-projectfiles-UCI HAR Dataset.zip` in the working directory, 
unzipped the data.

Loaded `activity_labels` to use as descriptive activity names.
Loaded `features` to use as variable name.

Loaded portions of `train` data and `test` data.
Combined portions of `train` data and portions of `test` data 
and combined them together to get one data set `mydf`.

Merged `mydf` with `activity_labels` to get desciptive activity labels.

Selected only the features with `mean()` and `std()` for each measurement 
and gathered all features as variables 
and grouped as required 
and summarized with average values
and write down `tidy-data.txt` file.

Note that the data set written in file has 
`the average of each variable for each activity and each subject` 
which is the requirement of the project.
