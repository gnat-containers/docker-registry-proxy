#!/usr/bin/env sh

NAME=registry_proxy
REGISTRIES="gcr.io gcr.mirrors.ustc.edu.cn k8s.gcr.io quay.io registry.fireball registry-elder.fireball"
DISABLE_CA_CREATEING=false
AUTH_REGISTRIES="registry@username:pass"

dir=$(cd `dirname $0`;pwd)
IMG=joc98/nginx-proxy-connect-stable-alpine:nginx-1.14.0-alpine-3.8
docker stop $NAME && docker rm $NAME
rm -rf `pwd`/docker_mirror_certs/*
docker run -d --name $NAME -it \
    -p 0.0.0.0:3128:3128 \
    -v $(pwd)/mapping:/etc/nginx/mapping \
    -v $(pwd)/docker_mirror_cache:/docker_mirror_cache \
    -v $(pwd)/docker_mirror_certs/ca:/ca \
    -v $(pwd)/docker_mirror_certs/certs:/certs \
    -e REGISTRIES="$REGISTRIES" \
    -e AUTH_REGISTRIES="$AUTH_REGISTRIES" \
    -e DISABLE_CA_CREATEING="$DISABLE_CA_CREATEING" \
    ${IMG}
