# Analysis
Getting and Cleaning Data Course Project
The provided code for this final course project performs the following major tasks:
* It opens and loads datasets from the local \\data folder.
* It merges test and train datasets 
* It extracts the columns that maintain the mean or standard deviation of measures, it does that by finding columns that have "mean()" or "std()" in their names.
* It cleans up the names by removing braces
* It transform the column names into descriptive ones 
* And finally it melts down the dataset into a skinny one 
