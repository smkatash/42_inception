#!/bin/bash

if ! id $FTP_USER &>/dev/null; then
	mkdir -p /var/www/wordpress
	cp /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
	adduser $FTP_USER --disabled-password
	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $FTP_USER:$FTP_USER /var/www/wordpress
	# to add the command output to the end of the file. tee -a, elevates to sudo and appends
	echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null
fi

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf