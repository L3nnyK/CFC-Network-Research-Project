#!/bin/bash

#1.Install relevant applications on the local computer.

#Get initial IP address and country. Setup the variables necessary for later.

#This function pulls the ip and country info at start state."
function Originchk()
{
BaseIP=$(curl -s ipinfo.io/ip)
BaseCountry=$(curl -s ipinfo.io/country)
echo "Your base IP is $BaseIP, located in $BaseCountry."
}

Originchk

#This fucntion gets the base system initialised with an apt update and installing required dependencies."
function initialise()
{
	#Add in apps as needed, assume nmap, ssh, whois are all not installed.
	
	sudo apt update && sudo apt install -y sshpass nmap ssh whois openssh-client tor
}

#This function gets Nipe installed and setup including 'running it' once to circumvent its janky errors.
function nipemeup()
{
	cd ~
	echo "Setting current location to:"
	pwd
		
# Download the repository
	git clone https://github.com/htrgouvea/nipe && cd nipe

# Install libs and dependencies
	echo "Yes" | sudo cpan install Try::Tiny Config::Simple JSON

#Nipe installation must be run as root.
 sudo perl nipe.pl install
 
#Nipe is janky and silly. Its seems nipe needs to be started and stopped first before it can work.
cd ~/nipe
sudo perl nipe.pl start
sudo perl nipe.pl stop
sudo perl nipe.pl status
	
}

#Text output to explain what is happening and to call on the functions above. Empty echo's to space the text.
echo
echo
echo "Getting your system ready.................."
echo
echo -e "Initialising.\n Please provide root password when prompted."
echo
initialise
echo
echo "Proceeding to get Nipe setup."
echo
nipemeup

###########################################################################

#2. Check if the connection is anonymous
#~ Check if the connection is from your origin country. If no, continue.
#~ Available tools: curl, whois

#Get current IP address and country. Setup the variables.
function Currentchk()
{
CurrentIP=$(curl -s ipinfo.io/ip)
CurrentCountry=$(curl -s ipinfo.io/country)
echo "Your current IP is $CurrentIP, located in $CurrentCountry."
}

#Function to start Nipe and check the current status
function anoncheck()
{
	cd ~/nipe
	echo "Moving you to the correct directory:";	
	pwd
	
	statuschk=$(sudo perl nipe.pl status | grep -w activated)
	
	if [ ! -z "$statuschk" ]
	then
		echo "Nipe is active."
		echo
	else
		echo "Nipe is not yet active, you are exposed. Starting Nipe now."
		echo
	fi
}

Currentchk

echo "Checking things are in order. Nipe is working and your location is obfuscated."
echo 
echo

#If statement to compare countries from start state with current state and ensure location is obfuscated.
if [ "$CurrentCountry" != "$BaseCountry" ];
then
echo "You are anonymous."
else
echo -e "You are exposed, but I will take care of it. \n Just a moment......."
echo
echo 
anoncheck
cd ~/nipe
sudo perl nipe.pl start
anoncheck
sudo perl nipe.pl status
fi

#~ 3. Connect automatically to the VPS and execute tasks
#~ Once the connection is anonymous, communicate via SSH and execute nmap
#~ scans and whois queries.
#~ Available tools: sshpass, ssh

#Digital Ocean Ubuntu Test Environment 128.199.179.192. Not worrying about the VPS security here.
#User root
#Password LkNRTest!B0X

echo "You are all set. Connecting you to 128.199.179.192"

sshpass -p 'LkNRTest!B0X' ssh -o StrictHostKeyChecking=no root@128.199.179.192 'apt update && apt install -y nmap ssh sshpass whois && nmap -oA scanresults -Pn $(curl -s ipinfo.io/ip) && whois $(cat scanresults.gnmap | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | uniq) >> whoisresults'

#Get the outputs thank you very much.
echo "Getting you your files, please check ~/ for scanresults.gnmap and whoisresults files."
sshpass -p 'LkNRTest!B0X' scp root@128.199.179.192:"scanresults.gnmap" ~/ && sshpass -p 'LkNRTest!B0X' scp root@128.199.179.192:"whoisresults" ~/

#Change directory and show where files have been saved.
cd ~/
filestore=$(pwd)
echo -e "Your files are located here in $filestore. \n Listing them here for you now."
echo 
ls
