FROM lsiobase/ubuntu:bionic

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN echo "Asia/Shanghai" | tee /etc/timezone

# make sure apt is up to date
RUN apt-get update --fix-missing
RUN apt-get install -y curl git
RUN apt-get install -y build-essential libssl-dev openjdk-8-jre-headless

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.16.1

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

VOLUME "/app/MCSManager"

EXPOSE 25565 25575 8123 23333 20010 20011 10021

COPY docker-entrypoint.sh /etc/services.d/mcmanager/run
RUN chmod +x /etc/services.d/mcmanager/run
