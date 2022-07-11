#!/bin/bash

#1.Install relevant applications on the local computer.

#Script must be run with sudo to work.

function initialise()
{
	#Add in apps as needed, assume nmap, ssh, whois are all not installed.
	
	sudo apt-get update && apt-get install -y sshpass nmap ssh whois openssh-client tor
}

function nipemeup()
{
	cd ~
	echo "Setting current location to:"
	pwd
		
# Download the repository
	git clone https://github.com/htrgouvea/nipe && cd nipe

# Install libs and dependencies
	echo "Yes" | sudo cpan install Try::Tiny Config::Simple JSON

 # Install Nipe, must be run as root.
 sudo perl nipe.pl install
	
}
echo "Getting your system ready."
echo  
echo "Initialising. Please provide root password when prompted."
initialise
echo
echo "Proceeding to get Nipe setup."
nipemeup

###########################################################################

#Get initial IP address and country. Setup the variables necessary for later.

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

#Silly but its seems nipe needs to be started and stopped first before it can work.
cd ~/nipe
sudo perl nipe.pl start
sudo perl nipe.pl stop

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

#Digital Ocean Ubuntu Test Environment 128.199.179.192
#User root
#Password LkNRTest!B0X

echo "You are all set. Connecting you to 128.199.179.192"

sshpass -p 'LkNRTest!B0X' ssh -o StrictHostKeyChecking=no root@128.199.179.192 'apt update && apt install -y nmap ssh sshpass whois && nmap -oA scanresults -Pn $(curl -s ipinfo.io/ip) && whois $(cat scanresults.gnmap | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | uniq) >> whoisresults'

#Get the outputs thank you very much.
echo "Getting you your files, please check ~/ for scanresults.gnmap and whoisresults files."
sshpass -p 'LkNRTest!B0X' scp root@128.199.179.192:"scanresults.gnmap whoisresult" ~/    


