#!/bin/bash

{
    # обновить списки пакетов из репозиториев
    sudo apt -y update
    # обновить версию пакета до последней, если пакет не указан будут обновлены все пакеты
    sudo apt -y upgrade
    sudo apt -y install libfcgi-dev spawn-fcgi nginx links
    # компилируем приложене с подключением библиотеки libfcgi
    sudo gcc -o main hello.c -lfcgi
    # запуск процессов в FastCGI режиме (-a <адрес>, -p <порт>, -f <путь(приложения)>, -P <путь(PID_файла)>)
    spawn-fcgi -a 127.0.0.1 -p 8080 -f /home/${whoami}/DO5_SimpleDocker-0/src/server/main -P /home/${whoami}/DO5_SimpleDocker-0/src/server/pid.txt
    sudo cp -f nginx.conf /etc/nginx/
    # перезагрузка конфигурационного файла
    sudo nginx -s reload
    sudo links http://localhost:81
}
