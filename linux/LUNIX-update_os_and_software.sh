#!/bin/bash
##HEADER
#RELEASE         : 20210906
#CREATOR         : LucaMH
#CONTRIBUTORS    : -
#LICENSE         : MIT
#DISCLAIMER      : if this script breaks your system, it is your fault you ran conde before checking the code, always check code which you dont own before running it!

##GLOBAL SETTINGS
#Variables

##MAIN
#RUNNING UPDATES
UPDATE_NONOS
UPDATE_OS

#reboot
echo "script finished"
echo "rebooting now"
reboot now
systemctl reboot now
shutdown -r now

exit

##FUNCTIONS
#update appliances with this function
UPDATE_NONOS () {

}

UPDATE_OS () {
    
    #dnf&yum
    if [ -x "$(command -v dnf)" ] | [ -x "$(command -v yum)" ];
        if [ -x "$(command -v dnf)" ]
        then
            echo "dnf found"
            dnf upgrade -y -v --refresh
        else
            echo "yum found"
            yum update -y 
        fi
    fi


}
