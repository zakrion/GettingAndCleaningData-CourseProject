

###########################################################################
## STEP 1: Merges the training and the test sets to create one data set. ##
###########################################################################

# It starts by reading each file into a varible
stest <- read.table("./dataset/test/subject_test.txt")
ytest <- read.table("./dataset/test/y_test.txt")
xtest <- read.table("./dataset/test/X_test.txt")

strain <- read.table("./dataset/train/subject_train.txt")
ytrain <- read.table("./dataset/train/y_train.txt")
xtrain <- read.table("./dataset/train/X_train.txt")

# Then merges the sets (train + test) variables: 
s_full <- rbind(stest,strain)
y_full <- rbind(ytrain,ytest)
x_full <- rbind(xt,xtest)

# It reads features file to get the name of the variables contained in X files
# It will read a vector with time and frequency domain variables. 
# Then it renames the column names with the proper names it should have (this is step 4)
columns <- read.table("./dataset/features.txt")
# We take only the second column as it creates a first column we don't need. 
columns <- columns[,2]

colnames(x_full) <- columns

# A data frame is createad with the information gathered. 
data <- data.frame(s_full,y_full,x_full)

######################################################################################################
## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.  ##
######################################################################################################

# Obtain the columns with mean or std information
# NOTE: It was said that we could take either columns containing words "std" or "mean", or just to take 
# the columns containing "mean()" or "std()". I decided to go for the first option just because the grep is easier. 
column_filter <- c(grep("std",colnames(data)),grep("mean",colnames(data)))

# Create a new data frame just with the columns we need: subject (1), activity (2), mean columns and std columns.
data_filtered <- data[c(1,2,column_filter)]

#####################################################################################
## STEP 3: Uses descriptive activity names to name the activities in the data set  ##
#####################################################################################

# Read activity file, which is a file with a table that associates a number/ID with an activity name
activities <- read.table("F:/datos/dataset/activity_labels.txt")

# Rename columns of activity vector to make the upconming code more readable, and rename data frame 
# columns that were unprecise (this is for step 4)
activities <- rename(activities, ID = V1, activity_name = V2)
data_filtered <- rename(data_filtered, subject = V1, activity = V1.1)

# Replacing activity ID numbers (1-6) by their name.
for (i in activities[,"ID"]) {data_filtered$activity[data_filtered$activity == i] <- as.character(activities[i,"activity_name"])}

##################################################################################
## STEP 4: Appropriately labels the data set with descriptive variable names.   ##
##################################################################################

# I thought this step was important enough to be done before, so nothing to do here, the data frame
# is fully labeled with the correct names it should have in each column.

################################################################################################
## STEP 5: From the data set in step 4, creates a second, independent tidy data set with the  ## 
## 		   average of each variable for each activity and each subject.                       ##
################################################################################################

# We melt the data by activity and subject and create the tidy data frame using dcast and output it to a file
# This was done as in Reshaping data lession.
melted_data <- melt(data_filtered, id=c("activity","subject"))

tidy_data <- dcast(melted_data, activity + subject ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE )
