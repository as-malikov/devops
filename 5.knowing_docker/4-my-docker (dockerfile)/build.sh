#!/bin/bash

{
    # запуск Dockerfile с именем и тегом
    docker build . -t nginx-img:1.0.0
}