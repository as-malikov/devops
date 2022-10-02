#!/bin/bash

{
    # запуск Dockerfile с именем и тегом
    docker build . -t nginx-img:2.0.0
}