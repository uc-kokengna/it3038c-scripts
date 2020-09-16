#!/bin/bash
#This script will email us our user, ip, hostname and today's date.
emailaddress=kokengna@mail.uc.edu
datetime=" Date: $( date +'%dd:%mm:%Y:%Hhr:%Mmin')"
ip=" IP_Address: $(ip a | grep 'dynamic ens192'| awk '{print $2}')"
Server=" Server_Name: $MACHTYPE"
Bashversion=" Bash_Version: $BASH_VERSION"


#Echo for my records and testing
echo Server_Name: $MACHTYPE
echo IP_Address: $ip
echo Bash_Version: $BASH_VERSION
echo $datetime

content="User: $USER"
mail -s "IT3038C Linux IP" $emailaddress <<< $(echo -e $content $ip $Server $Bashversion $datetime)

