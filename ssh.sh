#!/bin/bash
DEFAULT_SSHRELAY_SERVER=''
DEFAULT_SSHRELAY_PORT=2222
DEFAULT_SUBMIT_USER='admin'
DEFAULT_SUBMIT_USER_PASS=''
DEFAULT_RUN_USER='root'
DEFAULT_RUN_HOST=''

clear
read -p "PAM sshrelay server ($DEFAULT_SSHRELAY_SERVER): " sshrelayServer
read -p "PAM sshrelay port ($DEFAULT_SSHRELAY_PORT): " sshrelayPort
read -p "Submit User ($DEFAULT_SUBMIT_USER): " submitUser
read -s -p "Submit User password ($DEFAULT_SUBMIT_USER_PASS): " pass
echo
read -p "Run user ($DEFAULT_RUN_USER): " runUser
read -p "Run host ($DEFAULT_RUN_HOST): " runHost

sshrelayServer=${sshrelayServer:-$DEFAULT_SSHRELAY_SERVER}
sshrelayPort=${sshrelayPort:-$DEFAULT_SSHRELAY_PORT}
submitUser=${submitUser:-$DEFAULT_SUBMIT_USER}
pass=${pass:-$DEFAULT_SUBMIT_USER_PASS}
runUser=${runUser:-$DEFAULT_RUN_USER}
runHost=${runHost:-$DEFAULT_RUN_HOST}

echo -e "\n$submitUser@$sshrelayServer:$sshrelayPort -> $runUser@$runHost\n"
read -p "How many sessions? " numberOfTimes

for (( i=1; i<=$numberOfTimes; i++ ));
do

	./lib/spawnSSHSession.sh $sshrelayServer $sshrelayPort $submitUser $pass $runUser $runHost
	if [ $? -eq 0 ]; then
		echo -e "\nFinished session #$i.";
	else
		echo -e "\nThere was a problem with session #$i !";
	fi
	sleep 1

done
