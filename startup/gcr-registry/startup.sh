#!/usr/bin/env sh

CONTAINER_NAME=gcr-registry \
PORT=52000 \
HTTP_PROXY=http://10.42.78.21:8118 \
NO_PROXY="10.42.140.154,10.42.104.113,10.42.177.142,10.42.164.79,10.42.78.21,10.42.1.37,10.42.177.75,localhost,127.0.0.1,0.0.0.0,10.10.229.43,10.42.73.110,10.10.25.49,10.42.68.77,172.11.0.0,172.10.0.0,172.11.0.0/16,172.10.0.0/16,10.,172.,.cluster.info,.xinpinget.com,.huoqiuapp.com,charts.gitlab.io,.mirror.ucloud.cn,.mirror.aliyuncs.com,.docker.io,.gitlab.com" \
./registry-start.sh
