#!/bin/bash

if [ ! -f /home/MCSManager/property.js ]; then
    cd /home 
    rm -rf MCSManager
    git clone https://github.com/Suwings/MCSManager.git
    chown $PUID:$PGID -r MCSManager
    cd MCSManager 
    npm install --production
    node app.js
else
    chown $PUID:$PGID -r /home/MCSManager
    cd /home/MCSManager
    git pull --rebase
    npm install --production
    node app.js
fi
