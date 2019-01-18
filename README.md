# pam-sshrelay-traffic
Simple script to generate some ssh relay traffic through Privileged Account Manager (PAM). Initiates a connection through ssh-relay as `submitUser@sshrelayServer` to `runUser@runHost` and performs a simple directory listing to generate some session data. Submit User receives privileged Run User access through PAM, so only Submit User's password is needed.

Script will prompt for the following:
- SSH Relay Server
- SSH Relay Port
- Submit User
- Submit User Password
- Run User
- Run Host
- How many sessions?
