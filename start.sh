#!/bin/bash

REPLACE_VARS='$PHP_FPM_SERVICE:$PHP_FPM_PORT'
envsubst "$REPLACE_VARS" < /files/upstream.conf.template > /etc/nginx/conf.d/upstream.conf
nginx -g 'daemon off;'
