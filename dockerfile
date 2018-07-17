FROM openjdk:latest

EXPOSE 25565 25575 8123 23333 20010 20011 10021

RUN apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get install -y nodejs \
#  && curl -L https://www.npmjs.com/install.sh | sh \
  && apt-get install -y git \
  && npm i npm@latest -g
#RUN npm install -g grunt grunt-cli
RUN cd /home && git clone https://github.com/Suwings/MCSManager.git && cd MCSManager && npm install --production

WORKDIR /home/MCSManager

CMD ["/usr/bin/node", "app.js"]

