#!/bin/bash

service mysql start

cat /tmp/db_init.sql | mysql -u root
