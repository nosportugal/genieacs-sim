FROM node:10-alpine

RUN apk update && apk upgrade
WORKDIR /opt/genieacs-sim
COPY . ./
RUN npm install

ENV ACS_URL="http://genieacs:7547/"
ENV DATA_MODEL="./data_model_202BC1-BM632w-8KA8WA1151100043.csv"
ENV SERIAL_NUMBER="0"
ENV MAC_ADDRESS="20:2B:C1:E0:69:70"
ENV DEFAULT_TIMEOUT=10000

CMD ["./genieacs-sim","-u","http://genieacs:7547/"]