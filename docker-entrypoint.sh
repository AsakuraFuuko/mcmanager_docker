#!/usr/bin/with-contenv bash

if [ ! -f /app/MCSManager/property.js ]; then
    cd /app 
    rm -rf MCSManager
    git clone https://github.com/Suwings/MCSManager.git
    cd MCSManager 
    npm install --production
    chown -R abc:abc /app/MCSManager
    s6-setuidgid abc node app.js
else
    cd /app/MCSManager
    git pull --rebase
    npm install --production
    chown -R abc:abc /app/MCSManager
    s6-setuidgid abc node app.js
fi
