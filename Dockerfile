FROM node:7.8.0
WORKDIR /opt
ADD . /opt
RUN npm install
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf
RUN echo "nameserver 8.8.4.4" >> /etc/resolv.conf
ENTRYPOINT npm run start