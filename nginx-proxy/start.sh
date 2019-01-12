#!/usr/bin/env sh
nohup sh waiter.sh </dev/null >/dev/null 2>&1 &
nginx -g "daemon off;"