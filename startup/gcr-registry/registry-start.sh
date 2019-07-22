#!/usr/bin/env sh

dir=$(cd `dirname $0`;pwd)

docker stop $CONTAINER_NAME && docker rm $CONTAINER_NAME
docker run -d -p $PORT:5000 --restart=always \
--name $CONTAINER_NAME \
-e "HTTP_PROXY=$HTTP_PROXY" \
-e "HTTPS_PROXY=$HTTP_PROXY" \
-e "FTP_PROXY=$HTTP_PROXY" \
-e "NO_PROXY=$NO_PROXY" \
-e "http_proxy=$HTTP_PROXY" \
-e "https_proxy=$HTTP_PROXY" \
-e "ftp_proxy=$HTTP_PROXY" \
-e "no_proxy=$NO_PROXY" \
-v $dir/data:/var/lib/registry \
-v $dir/conf/config.yml:/etc/docker/registry/config.yml \
registry:2.6.2

