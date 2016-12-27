### Laravel Queue service in linux
You can use laravel queue service in linux kernel systems .
if something's wrong , you can fork the project and working on it and then send the merge request to merge :) 
#### Install

Download the install script
```bash
wget tika.pyguy.ir/dl/laravel_queue_install.sh
```

Run the script with sudo
```bash
sudo sh ./laravel_queue_install.sh
```

BOOM! Everything's okay , and show something amazing

## Usage
start the service

```bash
service laravel_queue start {path_of_your_laravel_project} {connection}
```

stop the service

```bash
service laravel_queue stop
```