#!/bin/bash
##HEADER
#RELEASE         : 20210906
#CREATOR         : LucaMH
#CONTRIBUTORS    : -
#LICENSE         : MIT
#DISCLAIMER      : if this script breaks your system, it is your fault you ran conde before checking the code, always check code which you dont own before running it!

##GLOBAL SETTINGS
#VARIABLES

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
   
    #update pip2 if existing (Thanks to @Sagamir)
    echo "trying to update pip2"
    if [ -x "$(command -v pip2)" ]
    then
        echo "updating pip2"
        pip2 install --upgrade pip
        sleep 2s
        echo "updating outdated pip2 packages"
        pip2 list --outdated | cut -f1 -d' ' | awk '{if(NR>=3)print}' | xargs -n1 pip install --upgrade
        sleep 2s
        echo "done"
    else
        echo "there is no pip2"
    fi 

    #update pip3 if existing (Thanks to @Sagamir)
    echo "trying to update pip3"
    if [ -x "$(command -v pip3)" ]
    then
        echo "updating pip3"
        pip3 install --upgrade pip
        sleep 2s
        echo "updating outdated pip3 packages"
        pip3 list --outdated | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip install --upgrade
        sleep 2s
    else
        echo "there is no pip3"
    fi

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

   #apt&apt-get
    if [ -x "$(command -v apt)" ] | [ -x "$(command -v apt-get)" ];
        if [ -x "$(command -v apt)" ]
        then
            echo "apt found"
            apt -y clean
            apt -y update
            apt -y upgrade
            apt -y autoremove
        else
            echo "apt-get found"
            apt-get -y clean
            apt-get -y update
            apt-get -y upgrade
            apt-get -y autoremove 
        fi
    fi

}
