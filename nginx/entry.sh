#!/bin/sh
# start nginx
nginx

# start cron
/usr/sbin/crond -f -l 8
