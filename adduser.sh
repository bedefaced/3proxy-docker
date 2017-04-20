#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
	DST="3proxy.cfg"
else
	DST=$1
fi

unset LOGIN

while [[ -z "$LOGIN" ]];
do
    read -p "Enter name: " LOGIN
done

unset PASSWORD

while [[ -z "$PASSWORD" ]];
do
    read -p "Enter password: " PASSWORD
    echo
done

echo "users $LOGIN:CL:$PASSWORD" >> $DST
