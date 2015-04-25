
# Getting and Cleaning Data - Course Project
# Code Book

### Variables

* `xtrain`, `ytrain`, `xtest`, `ytest`, `strain` and `stest` variables read from files in test and training sets.
* `x_full`, `y_full` and `s_full` merged data of the variables stored before
* `columns` column names of the X (`x_full`) variable, read from  the `features.txt` file. These names are later applied on the data set.
* `data` data frame created containing `x_full` + `y_full` + `s_full`.
* `column_filter` columns with std or mean information. This will be used to create a smaller data frame just with the columns needed.
* `data_filtered` data frame with the columns needed (using `column_filter` variable) plus activity and subject columns.
* `activities` data frame obtained from reading `activity_labels.txt` file which will be used to replace numbers with activity names in the data frame.
* `melted_data` temporal data frame with the data melted by activity and subject. 
* `tidy_data` data frame generated for step 5 using `melted_data` variable and `dcast` function.
