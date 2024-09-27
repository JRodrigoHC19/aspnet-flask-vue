#!bin/bash

# Variables
ID_BACK_C="service-csharp"
ID_BACK_F="service-flask"
ID_FRONT="service-vue"
BUILD_NAME_BACK_C="img-csharp"
BUILD_NAME_BACK_F="img-flask"
BUILD_NAME_FRONT="img-vue"


# GitHub
git clone https://github.com/JRodrigoHC19/aspnet-flask-vue.git
cd aspnet-flask-vue


# Steps
cd backend/api-flask

docker build -t $BUILD_NAME_BACK_F .
docker run -it -d --rm -p 8081:5000 --name $ID_BACK_F $BUILD_NAME_BACK_F



cd ../api-csharp

docker build -t $BUILD_NAME_BACK_C .
docker run -it -d --rm -p 8082:8080 --name $ID_BACK_C --link $ID_BACK_F:flask $BUILD_NAME_BACK_C


cd ../../frontend

docker build -t "$BUILD_NAME_FRONT" .
docker run -it -d --rm -p 8083:8080 --name $ID_FRONT --link $ID_BACK_C:aspnet $BUILD_NAME_FRONT


# sleep 30
# docker stop $ID_BACK_C
# docker stop $ID_BACK_F
# docker stop $ID_FRONT

# docker rmi $BUILD_NAME_BACK_C
# docker rmi $BUILD_NAME_BACK_F
# docker rmi $BUILD_NAME_FRONT