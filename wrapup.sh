#!/bin/bash


##########       Get User Input for naming       ###########
validator=""
while [ "$validator" != "y" ]; do
	echo -e "Ticket ID:			 	"
	read ticket
	echo -e "Customer's domain:			"
	read domain
	echo -e "Customer's cPanel UserName:		"
	read user
	echo -e "Does this look correct?\nUser:\t\t\t$user\nTicket ID:\t\t\t$ticket\nDomain:\t\t$domain"
	read validator
done

##########       Generate full CPMOVE backup     ###########
/scripts/pkgacct $user

#########        Move backups file to correct place ########
mv /home/cpmove-$user.tar.gz /home/hgdesign/backups/cpmove-$user.tar.gz

########         Set Ownership of new file       ###########
chown hgdesign /home/hgdesign/backups/cpmove-$user.tar.gz
chgrp hgdesign /home/hgdesign/backups/cpmove-$user.tar.gz

#######          Fix naming of backup file       ###########
mv /home/hgdesign/backups/cpmove-$user.tar.gz /home/hgdesign/backups/$ticket-$domain.tar.gz

######           Ask to kill account?            ###########
/usr/local/cpanel/scripts/removeacct $user
