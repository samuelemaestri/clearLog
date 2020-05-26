#!/bin/bash

DIR_LOG=/var/log
ROOT_UID=0 
LINEE=50 
E_XCD=66 
E_NONROOT=67

if [ "$UID" -ne "$ROOT_UID" ]; then
echo "You must be root to run this script."
exit $E_NONROOT
fi

if [ -n "$1" ]; then
linee=$1
else
linee=$LINEE 

cd $DIR_LOG
if [ ‘pwd‘ != "$DIR_LOG" ]; then
echo "I can't change into $DIR_LOG."
exit $E_XCD
fi 

tail -$linee messages > mesg.temp 
mv mesg.temp messages
cat /dev/null > wtmp 
echo "Log deleted."
exit 0