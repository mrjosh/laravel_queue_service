#!/bin/bash
# @author Alireza Josheghani <josheghani.dev@gmail.com>
# @since 26 Dec 2016
# @package Laravel queue service

pidFile="/var/run/laravel_queue.pid"

logFile="/var/log/laravel_queue.log"

if [ ! -f "./artisan" ]; then
    projectPath=$2
else
    projectPath='.'
fi

# make pid file service
makePidFile() {
    sudo touch $pidFile
    sudo chmod -R 0777 $pidFile
}

# make log file service
makeLogFile() {
    sudo touch $logFile
    sudo chmod -R 0777 $logFile
}

checkProgress() {
    progress="$(pgrep -fl queue:work)"

    if [[ $progress ]]; then
        echo "The service already started!"
        exit 0
    fi
}

# start the service
start() {
    checkProgress
    if [ ! -f "$projectPath/artisan" ]; then
        echo "The directory does not have the artisan file"
        exit 0
    fi

    echo "* Starting web server laravel queue worker"
    makePidFile
    makeLogFile
    echo "*"
    /usr/bin/php $projectPath/artisan queue:work redis & >> $logFile
    echo $!>$pidFile
    echo "* Started"
}

# stop the service
stop() {
    echo "* Stopping web server laravel queue worker"
    pid="$(<$pidFile)"
    kill $pid
    echo "*"
    if [ -f $pidFile ];then
        sudo rm $pidFile
    fi
    echo "* Stopped"
}

case $1 in
"start")
    start
   ;;
"stop")
    stop
   ;;
"restart")
    stop
    start
   ;;
*)
   echo "Usage: $0 {start|stop|restart}"
esac

exit 0