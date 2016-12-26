#!/bin/bash

source ./helpers

echo "\033[33m* Installing ...\033[0m"

echo "*"
echo "*"
echo "*"

# make pid file service
makePidFile() {
    sudo touch $pidFile
    sudo chmod -R 0777 $pidFile
    echo "* Created pid file > \033[33m[ $pidFile ]\033[0m"
    echo "*"
}

# make log file service
makeLogFile() {
    sudo touch $logFile
    sudo chmod -R 0777 $logFile
    echo "* Created log file > \033[33m[ $logFile ]\033[0m"
    echo "*"
}

if [ ! -f $pidFile ]; then
    makePidFile
fi

if [ ! -f $logFile ]; then
    makeLogFile
fi

echo "\033[32m* Service is ready to use , make something special :)\033[0m"