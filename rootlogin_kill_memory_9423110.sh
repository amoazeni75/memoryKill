#!/bin/sh
echo "in this script in first check are you root user or not, then kill all process that takes memory usage more than 3%\n 
S.Alireza Moazeni 9423110\n"

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

Max_RAM_Usage='2.0'; #%

ps -aux | 
    awk '{
        RAM_Usage = $4;
        PID = $2;
	Proc_Name = $11;
        if( RAM_Usage >= '$Max_RAM_Usage' )
        {
            
               	system ("echo PID is : "PID" with Memory Usage is : "RAM_Usage"% , Process name : "Proc_Name" will be kill");
		system ("kill -9 " PID);
                
        }
    }';
