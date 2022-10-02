#!/bin/bash

{
    VERSION="2.0.0"
    docker run \
    --name my-nginx \
    -v ${PWD}:/etc/nginx/ \
    -p 80:81 \
    -d \
    --rm \
    nginx-img:${VERSION}
}