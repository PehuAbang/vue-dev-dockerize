# base image
FROM node:12.16.0
 
# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
 
# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH
 
# install and cache app dependencies
COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json

RUN npm install
# start app
CMD ["npm", "run" , "serve"]

# docker build -t vue-dev-env .
# docker run -it -v ${PWD}:/usr/src/app -v /usr/src/app/node_modules -p 8080:8080 vue-dev-env