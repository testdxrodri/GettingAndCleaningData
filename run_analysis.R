require(plyr)
require(data.table)
setwd("C:\\Users\\Sham\\Documents\\DataScience\\GettingAndCleaningData")
xTrainData = read.table("UCI HAR Dataset\\train\\X_train.txt", sep="")
yTrainData = read.table("UCI HAR Dataset\\train\\Y_train.txt", sep="")

xTestData = read.table("UCI HAR Dataset\\test\\X_test.txt", sep="")
yTestData = read.table("UCI HAR Dataset\\test\\Y_test.txt", sep="")
features = read.table("UCI HAR Dataset\\features.txt",sep="")
activityLabels = read.table("UCI HAR Dataset\\activity_labels.txt",sep="")

names(xTrainData) = features[,2]
names(xTestData)  = features[,2]
xData = rbind(xTestData,xTrainData)
yData  = rbind(yTestData,yTrainData)
yData = join(yData,activityLabels)
colnames(yData) = c("activityId", "activity")
meanAndStdColumns =  grep("(*std*)|(*[M|m]ean*)",features[,2])
xDataFiltered = xData[,meanAndStdColumns ]
mergedFilteredData = data.table(cbind(yData,xDataFiltered))
#testData = head(mergedFilteredData[,1:5])
#testData[,lapply(.SD,mean),by=c("seqId","activity")]
averageData = mergedFilteredData[,lapply(.SD,mean),by=c("activityId","activity")]
averageData = averageData[order(activityId)]
write.table(averageData ,file= "averageData.csv" ,row.names=FALSE)

