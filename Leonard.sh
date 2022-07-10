#!/bin/bash

#1.Install relevant applications on the local computer.

#Script must be run with sudo to work.

function initialise()
{
	#Add in apps as needed, assume nmap, ssh, whois are all not installed.
	
	apt update && apt install -y nmap ssh whois openssh-client tor sshpass
	  
}

function nipemeup()
{
	cd /home/kali
	echo "Setting current location to:"
	pwd
	
# Download the repository
	git clone https://github.com/htrgouvea/nipe && cd nipe

# Install libs and dependencies
	echo "Yes" | cpan install Try::Tiny Config::Simple JSON

 # Install Nipe, must be run as root.
 sudo perl nipe.pl install
	
}
echo "Getting your system ready. Please ensure the script is run with sudo permission"
 
initialise && nipemeup

###########################################################################

#Get initial IP address and country. Setup the variables necessary for later.

# Included this line in case nipe is already running, the if loop will return that country of origins match. So we stop nipe before restarting it."
cd ~/nipe
sudo perl nipe.pl stop

function Originchk()
{
BaseIP=$(curl -s ipinfo.io/ip)
BaseCountry=$(curl -s ipinfo.io/country)
echo "Your base IP is $BaseIP, located in $BaseCountry."
}

Originchk


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

if [ "$CurrentCountry" != "$BaseCountry" ];
then
echo "You are anonymous."
else
echo "You are exposed, but I will take care of it."
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

#AWS Ubuntu Test Environment ec2-13-250-38-111.ap-southeast-1.compute.amazonaws.com
#User root
#Password LkNRTestB0X!

echo "You are all set. Connecting you to ec2-13-250-38-111.ap-southeast-1.compute.amazonaws.com"

sshpass -p 'LkNRTestB0X!' ssh root@ec2-13-250-38-111.ap-southeast-1.compute.amazonaws.com 'apt update && apt install -y nmap ssh sshpass whois && nmap -oA scanresults -Pn $(curl ipinfo.io/ip) && whois $(cat scanresults.gnmap | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | uniq)
'




