#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

SRC="$DIR/3proxy.cfg.dist"
DST="$DIR/3proxy.cfg"

if [[ ! -e $SRC ]]; then
	echo "Error: cannot find '$SRC'!"
	exit 1
fi

# create new file
yes | cp -rf $SRC $DST

# select DNS resolvers
DEFAULTDNS1="8.8.8.8"
DEFAULTDNS2="8.8.4.4"

read -p "Preffered DNS resolver #1: " -e -i $DEFAULTDNS1 DNS1
: ${DNS1:=$DEFAULTDNS1}

read -p "Preffered DNS resolver #2: " -e -i $DEFAULTDNS2 DNS2
: ${DNS2:=$DEFAULTDNS2}

sed -i -e "s@NS1@$DNS1@g" $DST
sed -i -e "s@NS2@$DNS2@g" $DST

# add users
ADDUSER="no"
ANSUSER="yes"

echo
echo "Configuring users..."
while [ "$ANSUSER" != "$ADDUSER" ]; 
do
	$DIR/adduser.sh $DST

	read -p "Would you want add another user? [no] " ANSUSER
	: ${ANSUSER:=$ADDUSER}
done

echo
echo "Configuration script completed."

