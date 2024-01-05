#!/bin/bash
echo "StayInTarkov Docker by bullet"

if [ -d "/opt/srv" ]; then
	start=$(date +%s)
    echo "Started copying files to your volume/directory.. Please wait."
    cp -r /opt/srv/* /opt/server/
	rm -Rf /opt/srv/* && rm -Rf /opt/srv/*.*
	rmdir /opt/srv
	touch /opt/server/delete_me
	end=$(date +%s)
	echo "Files copied to your machine in $(($end-$start)) seconds."
	echo "Starting the server to generate all the required files"
	cd /opt/server
	nohup timeout --preserve-status 10s ./Aki.Server.exe >/dev/null 2>&1 
	sleep 10
	echo "Follow the instructions to proceed!"
    exit 0
fi

if [ -e "/opt/server/delete_me" ]; then
    echo "Error: Safety file found. Exiting."
    echo "Please follow the instructions."
    exit 1
fi

cd /opt/server && ./Aki.Server.exe

echo "Exiting."
exit 0
