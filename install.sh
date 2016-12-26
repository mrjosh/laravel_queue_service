#!/bin/bash

pidFile="/var/run/laravel_queue.pid"

logFile="/var/log/laravel_queue.log"

echo ""
echo "* Installing ..."
echo "*"
# make pid file service
makePidFile() {
    sudo touch $pidFile
    sudo chmod -R 0777 $pidFile
    echo "* Created pid file"
    echo "*"
}

# make log file service
makeLogFile() {
    sudo touch $logFile
    sudo chmod -R 0777 $logFile
    echo "* Created log file"
    echo "*"
}

makePidFile
makeLogFile
echo "* Ready to go :)"
echo ""