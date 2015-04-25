

There is only one file in this project: `run_analysis.R`, it performs the 5 mandatory steps of this project, described below:

### STEPS in the Course Project:

- Merges the training and the test sets to create one data set. 

This is done by reading each variable file (3 variables and two sets -test and training-) into a variable, and then merging the test and training
into 3 unique variables which we use to create a data frame.

- Extracts only the measurements on the mean and standard deviation for each measurement. 

Data frame is reduced to contain only the columns having std or mean in their names. Before this, a column renaming is performed using a file which describes each column.

- Uses descriptive activity names to name the activities in the data set

Acitivities are defined by a number (1-6), and each number corresponds to an activity. This is specified in `activity_labels.txt`.

- Appropriately labels the data set with descriptive variable names. 

This is done before reaching this point of the code, columns are renamed using accurate description names. 

- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A new data frame called `tidy_data` is created by using melt and dcast functions, and a txt file called `tidy_data.txt` is created with this data frame.

