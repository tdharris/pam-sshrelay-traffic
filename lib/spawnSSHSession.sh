#!/usr/bin/expect -f

set SSHRELAY_SERVER [lindex $argv 0]
set SSHRELAY_PORT [lindex $argv 1]
set SUBMIT_USER [lindex $argv 2]
set SUBMIT_USER_PASS [lindex $argv 3]
set RUN_USER [lindex $argv 4]
set RUN_HOST [lindex $argv 5]

set timeout -1
spawn ssh -o PubkeyAuthentication=no -t -p $SSHRELAY_PORT $SUBMIT_USER@$SSHRELAY_SERVER $RUN_USER@$RUN_HOST ls -laR /var
expect -exact "assword: "
send -- "$SUBMIT_USER_PASS\r"
expect {\#\s*} { interact }
