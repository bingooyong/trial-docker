#!/bin/bash
# see https://hub.docker.com/_/telegraf

basedir=$(cd `dirname $0`;pwd)

mkdir -p telegraf_data # creates a folder for your data
ID=$(id -u) # saves your user id in the ID variable

docker stop telegraf
docker rm telegraf

docker run \
    -d --name telegraf \
    --user $ID \
    -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
    telegraf