
# FROM node:12

# LABEL MAINTAINER "NOS Inovação S.A."

# WORKDIR /app

# COPY . / ./

# #RUN apk --no-cache add \
# #      gzip \
# #      zlib-dev \
# #      bash \
# #      g++ \
# #      ca-certificates \
# #      lz4-dev \
# #      musl-dev \
# #      cyrus-sasl-dev \
# #      openssl-dev \
# #      make \
# #      python

# #RUN apk add --no-cache --virtual .build-deps gcc libc-dev bsd-compat-headers py-setuptools bash 
# RUN apt-get update
# RUN apt-get install -y zlib1g zlib1g-dev python ca-certificates \
# gzip liblz4-1 libsasl2-2 openssl bash build-essential

# RUN npm ci -q --production \
# && rm -f .npmrc


# COPY *.json readme.md ./config/

# #RUN apk add --no-cache libcap \
# RUN apt-get update
# RUN apt-get install -y libcap2-bin
# RUN setcap 'cap_net_bind_service=+ep' /app/src/app.js \
# && setcap 'cap_net_bind_service=+ep' /usr/local/bin/node \
# && chown -R node:node ./

# USER node

# CMD ["node", "/app/src/app.js"]
#####################
FROM node:10-alpine

RUN apk update && apk upgrade
# WORKDIR /opt
#RUN git clone git@github.com:nosportugal/genieacs-sim.git
WORKDIR /opt/genieacs-sim
COPY . ./
RUN npm install

ENV ACS_URL="http://genieacs:7547/"
ENV DATA_MODEL="./data_model_202BC1-BM632w-8KA8WA1151100043.csv"
ENV SERIAL_NUMBER="0"
ENV MAC_ADDRESS="20:2B:C1:E0:69:70"
ENV DEFAULT_TIMEOUT=10000

CMD ["./genieacs-sim","-u","http://genieacs:7547/"]
#####################
# FROM node:10-alpine

# RUN apk update && apk upgrade && apk add git
# WORKDIR /opt
# RUN git clone https://github.com/nosportugal/genieacs-sim.git
# WORKDIR /opt/genieacs-sim
# RUN npm install

# CMD ["./genieacs-sim","-u","http://genieacs:7547/"]