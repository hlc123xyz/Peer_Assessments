Getting and Cleaning Data Course Project CodeBook
===================================================
This CodeBook will describe the variables, the data, and any transformations or work that I did during claening up the data.
* A full description of the data is available at the site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  The data for this project is available for downloading at:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* The run_analysis.R script performs five major steps to clean the data and finally generate the new data set as required:
 1. The first step is to create a new data set that contains both trained and test data sets.
    * Rstudio commands used in this step:
      ```       
      read.table()
      rbind()
      ```
    * Training and testing sets are read in this step:   
      ```
      trianData | trainLabels | trainSubject
      testData  | testLabels  | testSubject
       
      ```
    * Merge training and testing sets to create one data set:
      ```
      mergedData | mergedLabels | mergedSubject
      ```
 2. The second step is to extract only the measurements on the mean and standard deviation for each measurement.
    *Rstudio commands used in this step:
     ```
        