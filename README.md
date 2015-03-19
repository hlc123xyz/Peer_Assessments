# Getting and Cleaning Data Course Project
=======================================================================
This file will guide you to run the run_analysis.R script.
*First, download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder as data.
*Make sure the data sets folder and the run_analysis.R script are both in the current working directory.
*Second, use source("run_analysis.R") command in Rstudio.
*Third, after running the run_analysis.R script, two output files will be generated in current working directory, which are:
-merged_clean_data.txt : this file contains a data frame called cleanData with 10299*68 dimension.
-data_with_means.txt : this file contains a data frame called meanData with 180*68 dimension.
*Fianlly, use the command data<-read.table("data_with_means.txt") in Rstudio to read the file. Since there are 30 subjects and 6 different activities in total, therefore we have 180 rows with all combinations for each of the 66 features. The data stands for the average of each variable for each activity and each subject.

? Lichao Hao 2015 All Rights reserved.

