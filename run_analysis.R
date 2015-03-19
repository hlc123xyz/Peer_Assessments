#Coursera course Getting and Cleaning Data, Course Project.
#Step1, merge the training and the test data sets to create one data set.
setwd(".data/train")
trainData<-read.table("X_train.txt")
trainLabels<-read.table("y_train.txt")
trainSubject<-read.table("subject_train.txt")

setwd(".data/test")
testData<-read.table("X_test.txt")
testLabels<-read.table("y_test.txt")
testSubject<-read.table("subject_test.txt")

mergedData<-rbind(trainData, testData)
mergedLabels<-rbind(trainLabels, testLabels)
mergedSubject<-rbind(trainSubject, testSubject)

#Step2, extracts only the measurements on the mean and standard deviation for each measurement.
setwd("./data")
features<-read.table("features.txt")
#extract the mean and standard deviation out from features first.
meanSDindices<-grep("mean\\(\\)|std\\(\\)", features[, 2])#a set of numeric values contains the identification number of 
                                                          #the desired variable in the mergedData set. 
length(meanSDindices)
#extract the mean and standard deviation variabls out from the mergedData set.
mergedData<-mergedData[, meanSDindices]
dim(mergedData)
#assign names on the column of mergedData
features<-features[meanSDindices, 2]#names, a set of character values.
head(features)
#give the names a clean look.
features<-tolower(features)
features<-gsub("\\(\\)", "", features)
features<-gsub("-", "", features)
features<-gsub("mean", "Mean", features)
features<-gsub("std", "Std", features)
head(features)
#assign names to the mergedData.
names(mergedData)<-features
head(mergedData)

#Step3, Uses descriptive activity names to name the activities in the data set.
activity<-read.table("activity_labels.txt")
head(activity)
activityLabel<-activity[mergedLabels[, 1], 2]#a set of charater values mathed with mergedLabels.
mergedLabels[,1]<-activityLabel
names(mergedLabels)<-"activity"
head(mergedLabels)

#Step4, appropriately labels the data set with descriptive vatiable names.
names(mergedSubject)<-"subject"
cleanData<-cbind(mergedSubject, mergedLabels, mergedData)
dim(cleanData)
write.table(cleanData, "merged_clean_data.txt")

#Step5, From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.
subjectLen <- length(table(mergedSubject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanData)[2]
meanData <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
meanData <- as.data.frame(meanData)
colnames(meanData) <- colnames(cleanData)
row <- 1
for(i in 1:subjectLen) {
        for(j in 1:activityLen) {
                meanData[row, 1] <- sort(unique(mergedSubject)[, 1])[i]
                meanData[row, 2] <- activity[j, 2]
                pat1 <- i == cleanData$subject
                pat2 <- activity[j, 2] == cleanData$activity
                meanData[row, 3:columnLen] <- colMeans(cleanData[pat1&pat2, 3:columnLen])
                row <- row + 1
        }
}
head(meanData)
dim(meanData)#180*68
write.table(meanData, "data_with_means.txt")