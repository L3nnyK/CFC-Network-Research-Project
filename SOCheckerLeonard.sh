#!/bin/bash

##Objective
#Create a script that runs different cyber attacks in a given network to check if monitoring alerts appear.

function menu ()
{
	#Initial selection menu.
#echo -e  \n for new line.

echo -e "\nPlease select the appropriate action by entering the corresponding number."
echo -e "\n1) To setup and initialise the system. \n2) To conduct system scans. \n3) for blah. \n \n0) To quit."
read CHOICE1
echo -e "\nYou chose $CHOICE1.\n"
case $CHOICE1 in

	1)
		echo "Starting system setup and initialisation. Please enter your password where prompted."
		
		inst
		
	;;

	2)
		echo "Taking you to the network scan menu."
	;;

	3)	echo "You chose 3"
	;;

	0)	echo "Quit" 
	exit
	;;
	
	*)  echo "Invalid option!"
	;;
	esac
}

#1. Install relevant application on local computer.

function inst()
{
sudo apt-get update && sudo apt-get install -y nmap masscan metasploit-framework 2>/dev/null

echo -e "\n "
#Run menu fucntion again to loop back. 
menu
}

#~ #2. Execute network scans and attacks. Allow the user to choose two methods of scanning and two different network attacks to run via your script.
#~ # Available tools: nmap, masscan, msfconsole

#~ function  chkme()
#~ #allow the user to choose different scans and attacks
#~ {

#~ }


#~ function LOGIT()
#~ #use this function to save results such as date, time, IPs, kind of attack.
#~ {

#~ }

#3. Log executed Attacks
#Every scan or attack should be logged and saved with the date and used arguments.

menu
