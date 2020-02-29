#!/bin/bash
# see https://hub.docker.com/_/influxdb
# cli docker exec -it influxdb influx

basedir=$(cd `dirname $0`;pwd)

mkdir -p influxdb_data # creates a folder for your data
ID=$(id -u) # saves your user id in the ID variable

docker stop influxdb
docker rm influxdb

docker run \
    -d --name influxdb \
    --user $ID \
    -p 8083:8083 -p 8086:8086 \
    -v $PWD/influxdb_data:/var/lib/influxdb \
    influxdb