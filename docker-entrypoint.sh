#!/bin/bash

if [ ! -f /home/MCSManager/property.js ]; then
    cd /home 
    git clone https://github.com/Suwings/MCSManager.git
    cd MCSManager 
    npm install --production
    node app.js
else
    cd /home/MCSManager
    git pull --rebase
    npm install --production
    node app.js
fi