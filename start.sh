#!/bin/bash

/etc/init.d/nginx start

touch /var/log/nginx/error.log
touch /var/log/nginx/symfony_error.log
touch /var/log/nginx/symfony_access.log

tail -f /var/log/nginx/*.log