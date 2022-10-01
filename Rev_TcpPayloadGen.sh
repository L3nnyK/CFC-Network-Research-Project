#!/bin/bash

#Exercise2: 10 minutes until 2:45pm
#- Create a script that gets from the user the Lhost and Lport
#- Automatically generate a windows/meterpreter/reverse_tcp payload

function Originchk()
{
BaseIP=$(curl -s ipinfo.io/ip)
BaseCountry=$(curl -s ipinfo.io/country)
echo "Your base IP is $BaseIP, located in $BaseCountry."
}

Originchk

ipi=$(hostname -I)
echo "Your current internal IP address is $ipi"

echo -e "[*] Please set the Lhost listening ip: "
read Lhost
echo -e "[*] Set the Lport listening port: "
read Lport



