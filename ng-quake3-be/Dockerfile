#STAGE 1: Build ###

# We label our stage as ‘builder’
FROM node:10-alpine

WORKDIR /var/

RUN apk --no-cache add git && \
    git clone https://github.com/kalik1/q3-server-docker-rest-api  && \
    cd ./q3-server-docker-rest-api/ && \
    npm ci && \
    npm run build

WORKDIR /var/q3-server-docker-rest-api/

CMD ["npm", "start"]
