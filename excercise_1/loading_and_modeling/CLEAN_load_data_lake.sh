#!/bin/bash

# save my current working directory
MY_CWD=$(pwd)

# empty and remove staging directories
rm ~/staging/exercise_1/*
rmdir ~/staging/exercise_1
rmdir ~/staging 

# remove files from hdfs
hdfs dfs -rm /user/w205/hospital_compare_new/hospitals/hospitals.csv
hdfs dfs -rm /user/w205/hospital_compare_new/effective_care/effective_care.csv
hdfs dfs -rm /user/w205/hospital_compare_new/readmissions/readmissions.csv
hdfs dfs -rm /user/w205/hospital_compare_new/Measures/Measures.csv
hdfs dfs -rm /user/w205/hospital_compare_new/surveys_responses/surveys_responses.csv

#remove our hdfs directories

hdfs dfs -rmdir /user/w205/hospital_compare_new/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare_new/effective_care
hdfs dfs -rmdir /user/w205/hospital_compare_new/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare_new/Measures
hdfs dfs -rmdir /user/w205/hospital_compare_new/surveys_responses
hdfs dfs -rmdir /user/w205/hospital_compare_new

# change directory back to original

cd $MY_CWD

exit
