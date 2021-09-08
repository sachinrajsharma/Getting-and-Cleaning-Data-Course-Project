# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project
Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

This is a R Programming project of Coursera Data Science Course- Getting and Cleaning Data. The name of the source file is run_analysis.R. This sourse file of R script will do the following as per the requiremen of this project : 

Step 1. Importing the data of activity, subject and feature info. Read data from the files into the variables.

(a) Read Features files.
(b) Read the Activity files.
(c) Read the Subject files.

Step 2. Merging the training set and the test sets to create single data set.

What do we learn from this project ? 

(a) Concatenate the data tables by rows.
(b) How to rename columns. 
(c) Merge columns to get the data frame Data for all data.


Step 3. Extracts only the measurements on the mean and standard deviation for each measurement.

(a) Subset Name of Features by measurements on the mean and standard deviation.
(b)Subset the data frame Data by selected names of Features.


Step 4. Uses descriptive activity names to name the activities in the data set.

(a) Read descriptive activity names from activity_labels.txt
(b)Factorize variable activity in the data frame Data using descriptive activity names.


Step 5. Appropriately labels the data set with descriptive variable names.

Step 6. Creating an independent tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

Step 7. Final output file is available by the name of tidydata.txt
