FROM node:latest
WORKDIR /usr/app
COPY package.json .
RUN npm install --quiet
RUN npm i -g nodemon
COPY . .

