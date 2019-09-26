FROM node:latest
COPY ./package.json /opt/app/
COPY ./src /opt/app/src/
COPY .env.dev /opt/app/
WORKDIR /opt/app/
RUN npm install
RUN npm i -g nodemon

EXPOSE 8080
CMD npm run start
