FROM openjdk:latest

EXPOSE 25565 25575 8123 23333

RUN apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
  && apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh \
  && apt-get install -y git 
RUN npm install -g grunt grunt-cli
RUN git clone https://github.com/Suwings/MCSManager.git
RUN cd MCSManager
RUN npm install --production

CMD ["node /MCSManager/app.js"]

