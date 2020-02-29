#!/bin/bash
# see https://www.jianshu.com/p/fc6a85d830ab

basedir=$(cd `dirname $0`;pwd)

mkdir -p data # creates a folder for your data
ID=$(id -u) # saves your user id in the ID variable

docker stop grafana
docker rm grafana

docker run \
       -d --name grafana  -p 3000:3000 \
       -e "GF_SERVER_ROOT_URL=http://grafana.server.name" \
       -e "GF_SECURITY_ADMIN_PASSWORD=newpwd" \
       --user $ID --volume "$PWD/data:/var/lib/grafana" \
       grafana/grafana grafana