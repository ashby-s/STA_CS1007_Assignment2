#!/bin/bash

#Student ID:   230022876

#Builds and runs countainer for hn- program and detaches this container 
podman build -t hn_run ./hn_Rundir
podman run -v A03-Volume:/A03-Volume --name=hn_cont -d --rm hn_run:latest

#Waits for container to completely be created
sleep 1

#Gathers stats for containers, and save this data to a relevant text file.
#Final section is to not show the error that the container has been deleted 
#Final section code inspired by Jeff Bowman from https://stackoverflow.com/questions/18062778/how-to-hide-command-output-in-bash
podman stats -i 1 hn_cont --no-reset --format "table  {{.CPUPerc}} {{.MemPerc}}" >> Mid_hnRunDataStore.txt 2>/dev/null

COUNTER=0

#Reads through all of the lines of the text file, and saves every even line to a csv file
while read lines; do
	if [ $COUNTER -eq 1 ]; then

		#The line has it's syntax changed, to be used in a csv file + to be parsed more easily for the final values
		Data=$(echo $lines | sed -e 's/\ \/\ /\//' -e 's/\ /,/g')
		#If there is a random error, where the data is considered 0, doesn't run the code where data is appended
		if [ $Data != "0.00%,0.00%" ]; then
			echo $Data >> ../data/hnRunDataStore.csv
		fi
		#Resets counter to get the next line
		COUNTER=-1

	fi
	#Adds 1 to the counter, at all instances
	COUNTER=$((COUNTER + 1))
done <  Mid_hnRunDataStore.txt

#Removes the unnecessary text file (all data should already be saved on csv file)
rm  Mid_hnRunDataStore.txt

#Builds and runs countainer for hn- program and detaches this container
podman build -t prog1_run ./prog1_Rundir
podman run -v A03-Volume:/A03-Volume --name=prog1_cont -d --rm prog1_run:latest

#Waits for container to completely be created
sleep 1

#Gathers stats for containers, and save this data to a relevant text file.
#Final section is to not show the error that the container has been deleted 
podman stats -i 1 prog1_cont --no-reset --format "table  {{.CPUPerc}} {{.MemPerc}}" >> Mid_prog1RunDataStore.txt 2>/dev/null

#Resets counter for next comparison
COUNTER=0

#Reads through all of the lines of the text file, and saves every even line to a csv file
while read lines; do
        if [ $COUNTER -eq 1 ]; then
			#The line has it's syntax changed, to be used in a csv file + to be parsed more easily for the final values
			Data=$(echo $lines | sed -e 's/\ \/\ /\//' -e 's/\ /,/g')
			#If there is a random error, where the data is considered 0, doesn't run the code where data is appended
			if [ $Data != "0.00%,0.00%" ]; then
				echo $Data >> ../data/prog1RunDataStore.csv
			fi
			#Resets counter to get the next line
			COUNTER=-1
        fi
		#Adds 1 to the counter, at all instances
        COUNTER=$((COUNTER + 1))
done < Mid_prog1RunDataStore.txt

#Removes the unnecessary text file (all data should already be saved on csv file)
rm Mid_prog1RunDataStore.txt

#Builds and runs countainer for hn- program and detaches this container
podman build -t test1_run ./test1_Rundir
podman run -v A03-Volume:/A03-Volume --name=test1_cont -d --rm test1_run:latest

#Waits for container to completely be created
sleep 1

#Gathers stats for containers, and save this data to a relevant text file.
#Final section is to not show the error that the container has been deleted 
podman stats -i 1 test1_cont --no-reset --format "table  {{.CPUPerc}} {{.MemPerc}}" >> Mid_test1DataStore.txt 2>/dev/null

#Resets counter for next comparison
COUNTER=0

#Reads through all of the lines of the text file, and saves every even line to a csv file
while read lines; do
		#The line has it's syntax changed, to be used in a csv file + to be parsed more easily for the final values
        if [ $COUNTER -eq 1 ]; then
			Data=$(echo $lines | sed -e 's/\ \/\ /\//' -e 's/\ /,/g')
			#If there is a random error, where the data is considered 0, doesn't run the code where data is appended
			if [ $Data != "0.00%,0.00%" ]; then
				echo $Data >> ../data/test1RunDataStore.csv
			fi
			#Resets counter to get the next line
			COUNTER=-1
        fi
		#Adds 1 to the counter, at all instances
        COUNTER=$((COUNTER + 1))
done <  Mid_test1DataStore.txt

#Removes the unnecessary text file (all data should already be saved on csv file)
rm  Mid_test1DataStore.txt
