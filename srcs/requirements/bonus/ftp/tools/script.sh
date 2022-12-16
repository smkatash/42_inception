#!/bin/bash

cp /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_USER /var/www/wordpress/ftp_user

echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf