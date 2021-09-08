
# Installing Packges : 

install.packages("data.table")
install.packages("reshape2")


# Importign Libraries 
library(data.table)
library(reshape2)
library(dplyr)
library(plyr);


# STEP : 1
# Question 1 : Merges the training and the test sets to create one data set.

# Importing Subject Files 
data_Test  <- read.table("Y_test.txt" )
view(data_Test)

data_Train <- read.table("Y_train.txt")


# Importing Activity Files 
data_Subject_Train <- read.table("subject_train.txt")
data_Subject_Test  <- read.table("subject_test.txt")
view(data_Subject_Test)

# Importing Feature Files 

data_Features_Test  <- read.table("X_test.txt")
data_Features_Train <- read.table("X_train.txt")

view(data_Features_Test)


# Checking the properties of the above data with the help of str() function :  

str(data_Test)
str(data_Train)

str(data_Features_Test)

str(data_Features_Train)

# Now merging the training and the test sets to create one data set


data_subject <- rbind(data_Subject_Train, data_Subject_Test)
data_activity<- rbind(data_Train, data_Test)
data_features<- rbind(data_Features_Train, data_Features_Test)


features_details <- read.table("features.txt")

view(features_details)

# Naming the variables 
names(data_subject)<-c("subject")# It will name the column as subject 
names(data_activity)<- c("activity")# It will name the column as activity 
data_features_names <- read.table("features.txt")

names(data_features)<- data_features_names$V2 # It will rename all the columns as per V2 column



# Now merging all the data together as per the requirement of Question : 1 


df_subject_activity <- cbind(data_subject, data_activity) # It will merge subject and activity data together 

df_final_merge <- cbind(data_features, df_subject_activity)# It will merge all the data 

view(df_final_merge)

# STEP : 2 : 

#Extracts only the measurements on the mean and standard deviation for each measurement. 

# Now extracting the measurement which have means and standard deviations 

#first taking feature names : 
subdata_features_names<-data_features_names$V2[grep("mean\\(\\)|std\\(\\)", data_features_names$V2)]

#Subset the data frame Data by seleted names of Features

selected_names<-c(as.character(subdata_features_names), "subject", "activity" )
data_final <-subset(df_final_merge,select=selected_names)


# STEP : 3 

#Uses descriptive activity names to name the activities in the data set

# Importing activity labels 
activity_labels <- read.table("activity_labels.txt")


# Factorize Variable activity in the data frame Data using descriptive activity names
data_final$activity<-factor(data_final$activity,labels=activity_labels[,2])


# STEP : 4 

# Appropriately labels the data set with descriptive variable names

#Feteatures will labelled using descriptive variable names.
# In this activity we will do the modification in the data as follows : 

#prefix t is replaced by time
#Acc is replaced by Accelerometer
#Gyro is replaced by Gyroscope
#prefix f is replaced by frequency
#Mag is replaced by Magnitude
#BodyBody is replaced by Body

names(data_final)<-gsub("^t", "time", names(data_final))
names(data_final)<-gsub("^f", "frequency", names(data_final))
names(data_final)<-gsub("Acc", "Accelerometer", names(data_final))
names(data_final)<-gsub("Gyro", "Gyroscope", names(data_final))
names(data_final)<-gsub("Mag", "Magnitude", names(data_final))
names(data_final)<-gsub("BodyBody", "Body", names(data_final))

# STEP: 5 
#Question : From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


data_final_2 <-aggregate(. ~subject + activity, data_final, mean)
data_final_2<-data_final_2[order(data_final_2$subject,data_final_2$activity),]
write.table(data_final_2, file = "tidydata.txt",row.name=FALSE)



head(data_final$activity,30)
