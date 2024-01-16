#!/bin/bash

#Student ID:   230022876

MaxMemVal=0

#Writes date on the final value text file
date >>  FinalDataVals.txt
echo >> FinalDataVals.txt

#Goes through all the values in the first column of the data file, adds them all, and divides by total number of lines
#Finds average of the values retrieved
#Code below inspired by Jonathan Leffler from https://stackoverflow.com/questions/19149731/use-awk-to-find-average-of-a-column
AvgCPUVal=$(awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' ../data/hnRunDataStore.csv)

#Creates an intermediary file of the data in the second column, without the percentage sign
#Code below inspired by Stryker from https://stackoverflow.com/questions/19602181/how-to-extract-one-column-of-a-csv-file
cut -d, -f2 ../data/hnRunDataStore.csv | sed s/%//g > RawMemVals.txt

#Goes through all of the lines of the intermediary file
while read NewMemValue; do

	#Checks if the new line, has a larger number than a previously defined maximum value 
	#Code below inspired by Serge Stroobandt from https://stackoverflow.com/questions/8654051/how-can-i-compare-two-floating-point-numbers-in-bash
	if (( $(echo "$MaxMemVal < $NewMemValue" |bc -l) )); then
		#If so, the new number is defined as the Maximum Number
		MaxMemVal=$NewMemValue
	fi

done < RawMemVals.txt 

#Writes all of the relevant data to Final Data textfile
echo "Program - Hn" >> FinalDataVals.txt
echo "Avg CPU : $AvgCPUVal%" >> FinalDataVals.txt
echo "Max Mem : $MaxMemVal%" >> FinalDataVals.txt
echo >> FinalDataVals.txt

MaxMemVal=0


#Goes through all the values in the first column of the data file, adds them all, and divides by total number of lines
#Finds average of the values retrieved
AvgCPUVal=$(awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' ../data/prog1RunDataStore.csv)

#Creates an intermediary file of the data in the second column, without the percentage sign
cut -d, -f2 ../data/prog1RunDataStore.csv | sed s/%//g > RawMemVals.txt

#Goes through all of the lines of the intermediary file
while read NewMemValue; do
	#Checks if the new line, has a larger number than a previously defined maximum value
	if (( $(echo "$MaxMemVal < $NewMemValue" |bc -l) )); then
		#If so, the new number is defined as the Maximum Number
		MaxMemVal=$NewMemValue
	fi
done < RawMemVals.txt 

#Writes all of the relevant data to Final Data textfile
echo "Program - prog1" >> FinalDataVals.txt
echo "Avg CPU : $AvgCPUVal%" >> FinalDataVals.txt
echo "Max Mem : $MaxMemVal%" >> FinalDataVals.txt
echo >> FinalDataVals.txt

MaxMemVal=0


#Goes through all the values in the first column of the data file, adds them all, and divides by total number of lines
#Finds average of the values retrieved
AvgCPUVal=$(awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }' ../data/test1RunDataStore.csv)

#Creates an intermediary file of the data in the second column, without the percentage sign
cut -d, -f2 ../data/test1RunDataStore.csv | sed s/%//g > RawMemVals.txt

#Goes through all of the lines of the intermediary file
while read NewMemValue; do
	#Checks if the new line, has a larger number than a previously defined maximum value
	if (( $(echo "$MaxMemVal < $NewMemValue" |bc -l) )); then
		#If so, the new number is defined as the Maximum Number
		MaxMemVal=$NewMemValue
	fi
done < RawMemVals.txt 

#Removes the mediary file (not relevant to final output)
rm RawMemVals.txt

#Writes all of the relevant data to Final Data textfile
echo "Program - test" >> FinalDataVals.txt
echo "Avg CPU : $AvgCPUVal%" >> FinalDataVals.txt
echo "Max Mem : $MaxMemVal%" >> FinalDataVals.txt
echo >> FinalDataVals.txt

