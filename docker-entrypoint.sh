#!/usr/bin/with-contenv bash

if [ ! -f /app/MCSManager/property.js ]; then
    cd /app 
    rm -rf MCSManager
    git clone https://github.com/Suwings/MCSManager.git
    cd MCSManager 
    s6-setuidgid abc \
    npm install --production
    s6-setuidgid abc node app.js
else
    chown -R abc:abc /app/MCSManager
    cd /app/MCSManager
    git pull --rebase
    s6-setuidgid abc \
    npm install --production
    s6-setuidgid abc node app.js
fi
