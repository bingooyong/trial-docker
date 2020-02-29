#!/bin/bash
# see https://github.com/joway/burrow-dashboard

basedir=$(cd `dirname $0`;pwd)
ID=$(id -u) # saves your user id in the ID variable

docker stop burrow-dashboard
docker rm burrow-dashboard

docker run \
    -d --name burrow-dashboard -p 9001:80 \
    -e BURROW_BACKEND=http://172.16.3.137:8000 \
    joway/burrow-dashboard