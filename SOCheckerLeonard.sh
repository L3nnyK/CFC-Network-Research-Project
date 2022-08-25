#!/bin/bash

##Objective
#Create a script that runs different cyber attacks in a given network to check if monitoring alerts appear.

function menu ()
{
	#Initial selection menu.
#echo -e  \n for new line.

echo -e "\nPlease select the appropriate action by entering the corresponding number followed by ENTER."
echo -e "\n1) To setup and initialise the system. \n2) To conduct system scans or attacks. \n3) View/Access the log files. \n \n0) To quit."
read CHOICE1
echo -e "\nYou chose option $CHOICE1.\n"
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
echo -e "\nYou chose option $CHOICE2.\n"
case $CHOICE2 in

	1)
		echo -e "Conducting an nmap scan. Please provide the requested inputs.\n "
		
		read -p "Please provide a target IP(s) or hostname(s) for nmap. (e.g Can be a specific ip or range, for example 192.168.1.1 or 192.168.1.0/24):" nmaptgtIP
		
		echo "You have entered $nmaptgtIP as the target ip or ip range for nmap."
		
		read -p "Please provide the target port(s) for nmap. (e.g Can be a specific port or port range, 80 or 100 -8080):" nmaptgtport
		
		echo -e "\nYou have entered $nmaptgtport as the target port or port range for nmap. \n Executing nmap scan......."
		
		#Run nmap scan ans save the output to a file
		sudo nmap -v -p "$nmaptgtport" -O "$nmaptgtIP" -oN nmapscan_output
		
		;;

	2)
		echo -e "Conducting a masscan. Please provide the requested inputs.\n"
		
		read -p "Please provide a target IP(s) or hostname(s) for masscan. (e.g Can be a specific ip or range, for example 192.168.1.1 or 192.168.1.0/24):" mstgtIP
		
		echo -e "\nYou have entered $mstgtIP as the target ip or ip range for masscan.\n"
		
		read -p "Please provide the target port(s) for masscan. (e.g Can be a specific port, ports or port range, 80, 22,53,80,443 or 100-8080):" mstgtport
		
		echo -e "\nYou have entered $mstgtport as the target port or port range for masscan.\n \nExecuting masscan........"
		
		#Executed the masscan.
		sudo masscan "$mstgtIP" -p "$mstgtport" > masscan_output
		
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
