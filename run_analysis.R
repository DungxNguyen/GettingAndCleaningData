


# 1
# Merge data

subject_test <- read.table( "./UCI HAR Dataset/test/subject_test.txt" )
subject_train <- read.table( "./UCI HAR Dataset/train/subject_train.txt"  )
subject <- rbind( subject_test, subject_train )

X_test <- read.table( "./UCI HAR Dataset/test/X_test.txt" )
X_train <- read.table( "./UCI HAR Dataset/train/X_train.txt"  )
X <- rbind( X_test, X_train )

Y_test <- read.table( "./UCI HAR Dataset/test/y_test.txt" )
Y_train <- read.table( "./UCI HAR Dataset/train/y_train.txt"  )
Y <- rbind( Y_test, Y_train )

# 2
# Select mean & std features

all_features <- read.table( "./UCI HAR Dataset/features.txt")
selected_features <- grep( pattern = "-mean\\(\\)|-std", all_features[ ,2 ] )
X_selected <- X[ , selected_features ]

# 3
# Name activities

activities <- read.table( "./UCI HAR Dataset/activity_labels.txt" )
Y_name <- activities[ Y[,1], 2 ]
Y_name <- as.data.frame( Y_name )

# 4
# Label

selected_features_name <- all_features[ selected_features, 2 ]
names( X_selected ) <- gsub( "\\(|\\)", "", selected_features_name )
names( Y ) <- "Activities"
names( subject ) <- "Subject"

final_tidy_dataset <- cbind( subject, Y, X_selected )
write.table( final_tidy_dataset, "final_tidy_dataset.txt" )

# 5
# Average

mean_data <- aggregate( . ~ Subject + Activities, data = final_tidy_dataset, mean )
write.table( mean_data, "mean_dataset_by_subject_and_activities.txt" )