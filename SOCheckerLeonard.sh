#!/bin/bash

##Objective
#Create a script that runs different cyber attacks in a given network to check if monitoring alerts appear.

function menu ()
{
	#Initial selection menu.
#echo -e  \n for new line.

echo -e "\nPlease select the appropriate action by entering the corresponding number."
echo -e "\n1) To setup and initialise the system. \n2) To conduct system scans or attacks. \n3) View/Access the log files. \n \n0) To quit."
read CHOICE1
echo -e "\nYou chose $CHOICE1.\n"
case $CHOICE1 in

	1)
		echo "Starting system setup and initialisation. Please enter your password where prompted."
		
		inst
		
	;;

	2)
		echo "Taking you to the network scan / attack menu."
		
		chkme
		
	;;

	3)	echo "View or access the log files."
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

function  chkme()
#allow the user to choose different scans and attacks
{
echo -e "\nPlease select the process you would like to start."
echo -e "\n1) Conduct an nmap scan. \n2) Conduct a masscan. \n3) Conduct an attack 1. \n4) Conduct an attack 2 \n0) To quit."
read CHOICE2
echo -e "\nYou chose $CHOICE2.\n"
case $CHOICE2 in

	1)
		echo "Conducting an nmap scan. Please provide the requested inputs."
		
		read -p "Please provide a target IP or hostname.:" targetip
		
		echo "You have entered $targetip as the target ip."
		
		#Run nmap scan ans save the output to a file
		sudo nmap -v -O -A "$targetip" -oN nmapscan
		
	;;

	2)
		echo "Conducting a masscan."
	;;

	3)	echo "Conducting an attack 1"
	;;
	
	4)	echo "Conducting an attack 2"
	;;

	0)	echo "Quit" 
	exit
	;;
	
	*)  echo "Invalid option!"
	;;
	esac
}

1
#~ function LOGIT()
#~ #use this function to save results such as date, time, IPs, kind of attack.
#~ {

#~ }

#3. Log executed Attacks
#Every scan or attack should be logged and saved with the date and used arguments.

menu
