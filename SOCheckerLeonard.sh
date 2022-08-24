#!/bin/bash

##Objective
#Create a script that runs different cyber attacks in a given network to check if monitoring alerts appear.

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
