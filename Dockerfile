
FROM node:23.11.1-alpine

RUN apk update && apk upgrade
WORKDIR /opt
COPY . ./genieacs-sim
WORKDIR /opt/genieacs-sim
RUN npm install

CMD ["./genieacs-sim","-u","http://genieacs:7547/"]