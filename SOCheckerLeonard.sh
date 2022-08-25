#!/bin/bash

##Objective
#Create a script that runs different cyber attacks in a given network to check if monitoring alerts appear.

#Create 1 set of options

#echo -e  \n for new line.

echo -n "Please select the appropriate action by entering the corresponding number."
echo -e "\n1) for blah. \n2) for blah. \n3) for blah."
read CHOICE1

case $CHOICE1 in

	1)
		echo "You chose 1"
	;;

	2)
		echo "You chose 2"
	;;

	3)	echo "You chose 3"
	;;

	4)	echo "Quit" exit
	;;
	esac

#1. Install relevant application on local computer.

function inst()
{
sudo apt-get update && sudo apt-get install -y nmap massscan msfconsole
}

#2. Execute network scans and attacks. Allow the user to choose two methods of scanning and two different network attacks to run via your script.
# Available tools: nmap, masscan, msfconsole

function  chkme()
{
#allow the user to choose different scans and attacks

}

function LOGIT()

{
#use this function to save results such as date, time, IPs, kind of attack.

}
#3. Log executed Attacks
#Every scan or attack should be logged and saved with the date and used arguments.
