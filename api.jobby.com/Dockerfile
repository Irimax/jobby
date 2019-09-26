FROM node:latest
COPY ./package.json /opt/app/
COPY ./src /opt/app/src/
COPY .env.dev /opt/app/
WORKDIR /opt/app/
RUN npm install
RUN npm i -g nodemon

EXPOSE 6005
CMD npm run start
