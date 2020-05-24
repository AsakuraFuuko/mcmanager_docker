FROM lsiobase/ubuntu

EXPOSE 25565 25575 8123 23333 20010 20011 10021

RUN echo "Asia/Shanghai" | tee /etc/timezone

RUN apt-get update -q && apt-get install -qy \
    wget \
    openjdk-8-jre-headless \
    && rm -rf /var/lib/apt/lists/*

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.16.1
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

VOLUME [/home/MCSManager]

RUN cd /home && git clone https://github.com/Suwings/MCSManager.git && cd MCSManager && npm install --production

WORKDIR /home/MCSManager
CMD ["/usr/bin/node", "app.js"]
