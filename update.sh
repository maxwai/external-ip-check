#!/bin/sh

cd /usr/src/app || return

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

runuser -u abc -- python ./main.py