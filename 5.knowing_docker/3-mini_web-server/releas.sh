#!/bin/bash

{
    kill -KILL "cat /home/${whoami}/DO5_SimpleDocker-0/src/server/pid.txt" &> /dev/null
    # полностью удалить пакеты, вместе со всеми его конфигурационными файлами
    sudo apt -y purge libfcgi-dev
    sudo apt -y purge spawn-fcgi 
    sudo apt -y purge nginx
    sudo apt -y purge links
    # очистить ненужные пакеты
    sudo apt -y autoremove
    rm main
    rm pid.txt
}
