#!/bin/bash

fileOptions () {
	echo "'move', 'remove', or 'exit'"
	read answer
	case "$answer" in
		remove)
			ls -ahl
			echo "Which file or directory do you want to remove?"
			read file1
			echo "Are you sure you want to remove that file? (y/n)"
			read yesno
			if [ "$yesno" == y ]; then
				if [ -d $file1 ]; then
				    rm -dr "$file1"
				else
				   rm "$file1"
				fi

			fi
			read -p "Press [enter] to exit"
			ls -ahl
			;;
		move)
			ls -ahl
			echo "What's the file path of the source file"
			read src
			echo "What is the destination path?"
			read dest
			mv $src $dest
			cd $dest
			echo "Your file is located here"
			ls -h
			read -p "Press [enter] to exit"
			ls -ahl
			;;
		exit)
			;;
		*)
			echo "type in a valid command"
			file_options
			;;
	esac
}

main () {
	clear
	sudo du -hsx * | sort -rh | head -10
	echo "'modify', 'change' directory, or 'exit'?"
	read response
	if [ "$response" == "modify" ]; then
	    fileOptions
	elif [ "$response" == "change" ]; then
	    echo "Which directory do you want to go to?"
	    read directory
	    cd $directory
	    main
	elif [ "$response" == "exit" ]; then
	    exit 0
	fi
}

clear

echo "This program finds large files in your directories."
echo "If you find some, then you will have the option to remove those files."
cd /
read -p "Press [enter] to continue"

main


