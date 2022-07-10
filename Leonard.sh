#!/bin/bash

#1.Install relevant applications on the local computer.

#Script must be run with sudo to work.

function initialise()
{
	#Add in apps as needed, assume nmap, ssh, whois are all not installed.
	
	apt update && apt install -y nmap ssh whois openssh-client tor
	  
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

#2. Check if the connection is anonymous
#~ Check if the connection is from your origin country. If no, continue.
#~ Available tools: curl, whois

#~ function anoncheck()
#~ {
	#~ cd /home/leonard/nipe
	#~ echo "You current location is at:"
	#~ pwd
	
	#~ statuschk=$(sudo perl nipe.pl status | grep -w activated)
	
	#~ if [ ! -z "$statuschk" ]
	#~ then
		#~ echo "You are anonymous."
	#~ else
		#~ echo "You are exposed."
	#~ fi
#~ }

#~ anoncheck
#~ cd /home/leonard/nipe
#~ sudo perl nipe.pl start
#~ anoncheck


#~ 3. Connect automatically to the VPS and execute tasks
#~ Once the connection is anonymous, communicate via SSH and execute nmap
#~ scans and whois queries.
#~ Available tools: sshpass, ssh


