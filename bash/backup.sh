#!/bin/bash
Time=`date +"%T"`
Day=`date +"%A"`
DayDate=`date +"%d"`
Month=`date +"%B"`
Year=`date +"%Y"`

response=""
currentMode="move"


#changes dir to response variable
switchCurrentDir() {
	#goes back in the working directory if user types ".."
	if [ "$response" == ".." ]; then
		cd ..
		$currentdir=$(pwd)
	#check if it is an actual file
	elif [ -d "$(pwd)/$response" ]; then
		#for root exception where it already has just a /
		if [ "$currentdir" == "/" ]; then
			cd "$(pwd)$response"	
		else
			cd "$(pwd)/$response"
		fi
	elif [ "$response" == "exit" ]; then
		exit
	else 
		echo "not recognized file name"	
	fi
}

changeMode() {
	ls
	echo "do you want to change current mode (y)"

	read answer

	if [ "$answer" == "y" ]; then
		echo "change mode to (b)ackup or (m)ove"
		read currentMode

		if [ "$currentMode" == "b" ]; then
			read -p "switched to backup mode (press enter to continue)"
			
		else
			read -p "switched to move mode (press enter to continue)"
		fi
	fi
}

backupFile() {
	src=""
		#for root exception where it already has just a /
		if [ "$currentdir" == "/" ]; then
			src="$(pwd)$response"	
		else
			src="$(pwd)/$response"
		fi
	echo "backup file selected"
	echo "where do you want the backup to go? (full file path)"
	read dest
	echo "what should the backup be called"
	read name

	if [ -d $dest ] && [ -d $dest/"$DayDate $Month $Year" ]; then
	echo -e "\e[38;5;35mBackup folder exists\e[0m"
	echo $time
	else
	echo -e "\e[38;5;35mBackup folder doesn't exist, creating it now ...\e[0m"
	#Creates both directories because even if one of the them exists, it will just fail and continue the program
	mkdir $dest
	mkdir $dest/"$DayDate $Month $Year"
	echo
	fi

	read -p "Press any key to continue" -n1 -s
	#Tar -v for displaying all the files put in the zip verbosely, -c for creating a tar instead of extracting, -z for gzip, -f for making an archive and -P for preventing the stripping the leading `/' from the file names
	tar -czvf $dest/"$DayDate $Month $Year"/$name.tgz $src
	cd $dest/"$DayDate $Month $Year"/
	ls -ahl >> /home/compsci/Desktop/BackupLog.txt
	echo "Your backup is located at $dest/'$DayDate $Month $Year'/$name.tgz"
	exit 0
}
main() {
	cd "/"
	while [ "$response" != "exit" ]; do
		
		clear
		if [ "$currentMode" == "b" ]; then
			ls
			echo "what do you want to backup (full file name)"
			read response
			backupFile
		else

			ls
			echo "where do you want to go (full file name)"
			read response
			switchCurrentDir
		

			clear
			changeMode
		fi
	done
}

## actual code
clear
echo "Do you want to backup a directory? (y)"
read answer

if [ "$answer" == "y" ]; then
	main

else 

	echo "backup aborted"
fi
