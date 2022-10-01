#!/bin/bash
echoe "Don't forget to run as sudo!"
echo -e "[*] Please set the target ip: "
read tgtip
echo -e "[*] Set the hostname of target: "
read tgtname
chmod +666 /etc/hosts
echo "$tgtip	$tgtname" >> /etc/hosts
chmod +644 /etc/hosts
