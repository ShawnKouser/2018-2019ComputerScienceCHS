#!/bin/bash
clear
echo "Today is `date +%A`"

echo "What process do you want to do (update, upgrade, autoclean, autoremove, all, exit)"
read answer
#if [ $answer == "update" ] then
#sudo apt update -y
#fi
#if [ $answer == "upgrade" ] then
#sudo apt upgrade -y
#fi
#if [ $answer == "autoclean" ] then
#sudo apt autoclean -y
#fi
#if [ $answer == "autoremove" ] then
#sudo apt autoremove -y
#fi
exit1 () {
read -p "Press [enter] to exit"
clear
exit 0
}
case "$answer" in
     update)
        clear
        sudo apt update -y
        echo "Finished updating captain"
        ;;
     upgrade)
        clear
        sudo apt upgrade -y
        echo "Upgraded everything"
        ;;
     autoclean)
        clear
        sudo apt autoclean -y
        echo "Cleaned all the cobwebs from the corners"
        ;;
     autoremove)
        clear
        sudo apt autoremove -y
        echo "Removed all the junk"
        ;;
     all)
        clear
        sudo apt update -y
        read -p "Updated, press [enter] to continue"
        sudo apt upgrade -y
        read -p "Upgraded everything, press [enter] to continue"
        sudo apt autoclean -y
        read -p "Cleaned, press [enter] to continue"
        sudo apt autoremove -y
        echo "Removed the junk"
        ;;
    exit)
	echo "Until next time"
	;;

	
	
    *)
        echo "Please try typing with more precision next time"
	;;

esac

exit1


