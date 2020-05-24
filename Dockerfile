FROM lsiobase/ubuntu

EXPOSE 25565 25575 8123 23333 20010 20011 10021

RUN echo "Asia/Shanghai" | tee /etc/timezone

RUN apt-get update -q && apt-get install -qy \
    wget \
    openjdk-8-jre-headless \
    && rm -rf /var/lib/apt/lists/*
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
RUN source /root/.bashrc
RUN nvm install 12.16.1 && nvm use 12.16.1

VOLUME [/home/MCSManager]

RUN cd /home && git clone https://github.com/Suwings/MCSManager.git && cd MCSManager && npm install --production

WORKDIR /home/MCSManager
CMD ["/usr/bin/node", "app.js"]
