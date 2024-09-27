#!bin/bash

docker build -t dockerize-vuejs-app .

docker run -it -p 8080:8080 --rm --name dockerize-vuejs-app-1 dockerize-vuejs-app
