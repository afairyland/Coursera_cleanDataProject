
options(stringsAsFactors=F)

### 0. read input file
train        <- read.delim("./UCI_HAR_Dataset/train/X_train.txt",   header=F, sep="")
train.y      <- read.delim("./UCI_HAR_Dataset/train/y_train.txt",   header=F)
train.sample <- read.delim("./UCI_HAR_Dataset/train/subject_train.txt",   header=F)
 
test         <- read.delim("./UCI_HAR_Dataset/test/X_test.txt",     header=F, sep="")
test.y       <- read.delim("./UCI_HAR_Dataset/test/y_test.txt",     header=F)
test.sample  <- read.delim("./UCI_HAR_Dataset/test/subject_test.txt",   header=F)

features  <- read.delim("./UCI_HAR_Dataset/features.txt",        header=F, sep=" ")
activity  <- read.delim("./UCI_HAR_Dataset/activity_labels.txt", header=F, sep=" ")
y         <- c(train.y[,1],test.y[,1])

### 1. merge the training and the test sets to create one data set
df        <- rbind(train,test)

### 2. Extract only the measurements on the mean an dstandard deviation for each measurement
idx.sub        <- grep("mean\\(|std\\(", features[,2])
df.sub         <- df[,idx.sub] 
names(df.sub)  <- as.character( features[idx.sub,2] )

### 3. Uses descriptive activity names to name the activities in the data set
description_row      <- paste0("subject",c(train.sample[,1],test.sample[,1]), "_", sapply(y, function(x){activity[x,2]} ) )

### 4. Appropriately labels the data set with descriptive variable names
m                    <- rbind(colnames(df.sub), df.sub)
m                    <- cbind(c("subject_activity", description_row), m)
write.table(m, file="./subject_activity.txt", sep="\t", quote=F, col.names=F, row.names=F)

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject 
o   <- t(sapply( split(df.sub, factor(description_row,unique(description_row))), function(x) {y=as.matrix(x); colMeans(y);}))
o   <- rbind(paste0("mean_",colnames(o)), o)
o   <- cbind(c("subject_activity", rownames(o)[2:nrow(o)]), o)
write.table(o, file="./per_subject_per_activity_mean.txt",sep="\t", quote=F, col.names=F, row.names=F)


