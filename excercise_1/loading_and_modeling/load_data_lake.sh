!/bin/bash

# save my current directory
MY_CWD=$(pwd)

# creating staging directories
mkdir ~/staging 
mkdir ~/staging/exercise_1

# changing to staging directory
cd ~/staging/exercise_1

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

# unzip the medicare data
unzip medicare_data.zip

# remove first line of files and rename

MY_FILE="Hospital General Information.csv"
NEW_FILE="hospitals.csv"

MY_FILE2="Timely and Effective Care - Hospital.csv"
NEW_FILE2="effective_care.csv"

MY_FILE3="Readmissions and Deaths - Hospital.csv"
NEW_FILE3="readmissions.csv"

MY_FILE4="Measure Dates.csv"
NEW_FILE4="Measures.csv"

MY_FILE5="hvbp_hcahps_11_10_2016.csv"
NEW_FILE5="surveys_responses.csv"

tail -n +2 "$MY_FILE">$NEW_FILE
tail -n +2 "$MY_FILE2">$NEW_FILE2
tail -n +2 "$MY_FILE3">$NEW_FILE3
tail -n +2 "$MY_FILE4">$NEW_FILE4
tail -n +2 "$MY_FILE5">$NEW_FILE5


#create our gifs directory

hdfs dfs -mkdir /user/w205/hospital_compare_new

# create directories and copy the file to hfs

hdfs dfs -mkdir /user/w205/hospital_compare_new/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare_new/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare_new/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare_new/Measures
hdfs dfs -mkdir /user/w205/hospital_compare_new/surveys_responses

hdfs dfs -put hospitals.csv /user/w205/hospital_compare_new/hospitals
hdfs dfs -put effective_care.csv /user/w205/hospital_compare_new/effective_care
hdfs dfs -put readmissions.csv /user/w205/hospital_compare_new/readmissions
hdfs dfs -put Measures.csv /user/w205/hospital_compare_new/Measures
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare_new/surveys_responses

# change directory back to original

cd $MY_CWD

exit
