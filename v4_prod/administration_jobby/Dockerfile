FROM node:latest
COPY ./package.json /opt/
COPY ./ /opt/src/
COPY .env.dev /opt/
WORKDIR /opt/app/
RUN npm install
RUN npm i -g nodemon

EXPOSE 9100
CMD npm run start
