# Getting and Cleaning Data Assignment CodeBook

## Origin of data
[Despcription][http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
[Source][https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

## Data Transformation

1. Merge Training sets and Testing sets into 1 dataset
  * Read X, y and subject sets (trainning and testing separately)
  * Use rbind() to merge each training and testing pairs into 1 table
2. Find the measuremnts on mean and std in all features
  * Read all the features (variables) name into a table
  * Use grep() to find the feature names contain "mean()" or "std"
  * Create a new X table (X_selected) by select from X features found from the previous step
3. Name activities in dataset
  * Read the activities table from file "activities_label.txt"
  * Transform activities numbers to activities names
4. Label the dataset
5. Calculate the average of each variable for each activity and subject

## Variables Description
### Please view in file "features_info.txt" in the dataset for Original Data Description

## Tranformed Dataset
### Subject
      Subject is the identification of each volunteer in the experiment
### Activities
      6 activities performed by volunteers in the experiment
### Variables from col 3 to 68
      mean values of 66 selected features from task 2(measurements on sum or std) for each subject and activities. Name of each column is the name of the measurement.