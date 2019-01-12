#!/usr/bin/env sh

# CONFIGURATION
DIR="/etc/nginx/conf.d/default.conf"
EVENTS="modify"
FIFO="/inotify.fifo"


on_event() {
  local date=$1
  local time=$2
  local file=$3

  sleep 5

  echo "'$file' was modified, restarting nginx"
  nginx -s reload
}

# MAIN
if [ ! -e "$FIFO" ]
then
  mkfifo "$FIFO"
fi

inotifywait -m -e "$EVENTS" --timefmt '%Y-%m-%d %H:%M:%S' --format '%T %f' "$DIR" >       "$FIFO" &
INOTIFY_PID=$!


while read date time file
do
  on_event $date $time $file &
done < "$FIFO"