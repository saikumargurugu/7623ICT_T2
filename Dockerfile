#Each instruction in this file creates a new layer
#Here we are getting our node as Base image
FROM node:latest
#Creating a new directory for app files and setting path in the container
RUN mkdir -p /usr/src/app
#setting working directory in the container
WORKDIR /usr/src/app
#copying the package.json file(contains dependencies) from project source dir to container dir
COPY social-media-dashboard/package.json /usr/src/app
# installing the dependencies into the container
RUN npm install
#copying the source code of Application into the container dir
#note you must be in the source code directory and remember COPY is recursive
COPY social-media-dashboard/. /usr/src/app
COPY ssl/. /usr/src/app/ssl
COPY nginx.conf /usr/src/app
COPY domains.ext /usr/src/app
COPY .env /usr/src/app
#container exposed network port number
EXPOSE 3000
EXPOSE 3001
#command to run within the container
CMD ["node", "app.js"]