# DevOps
_В этом репозитории содержатся учебные проектные по направлению DevOps, которые были мною выполнены по направлению DevOps (проекты выполнены на `Ubuntu 20.04 Server LTS`)_
## Содержание репозитория:
__1. Знакомство с Linux:__ 
  * Установка OS
  * Создание пользователя
  * Настройка timezone и network
  * Обновление ОС
  * Знакомство с `sudo`
  * Знакомство с текстовыми редакторами (`vim, nano, joe`)
  * Базовая настройка `sshd`
  * Знакомство с `top, htop`
  * Знакомство с `fdisk, df, du, ncdu`
  * Знакомство с `syslog, dmesg, authlog`
  * Знакомство с `CRON` 
  
__2. Знакомство с Network в Linux:__  
  * Инструмент `ipcalc`
  * Статическая маршрутизация между 2 машинами
  * Утилита `iperf3`
  * Сетевой экран
  * Статическая маршрутизация сети (2 роутера и 3 машины)
  * Динамическая настройка ip с помощью DHCP
  * NAT
  * Знакомство с SSH  

__3. Проект по мониторингу в _Linux v.1_ на "bash":__  
  * Вывод параметра
  * Вывод информации о системе с возможностью записи в файл
  * Вывод информации о системе с расцветкой
  * Вывод информации о системе с расцветкой, данные берем из файла *.conf
  * Расширенный вывод информации о каталоге

__4. Проект по мониторингу в _Linux v.2_ на "bash"__  
  * Скрипт с параметрами для "генерации дирректорий с файлами" вида __./main.sh /etc/dhcpd 5 xyz 8 xyz.xyz 10kb__  
  `1 - Путь`,  
  `2 - кол-во вложенных папок`,  
  `3 - список букв для имени директории (не более 7 знаков)`,  
  `4 - кол-во созданных файлов в директории`,  
  `5 - список букв для имени файла`,  
  `6 - размер файла`.  
  * Скрипт с параметрами для "засорение file system" вида __./main.sh xyz xyz.xyz 10mb__  
  `1 -  список букв для имени директории`,  
  `2 - список букв для имени файла`,  
  `3 - размер файла`.  
  * Скрипт с параметрами для "очистки file system" с одним парамтром  
  `1 - по созданому *.log`,  
  `2 - по созданному date & time`,  
  `3 - по названию файла (маска: "символы_date")`.  
    
__5. Проект с `docker`:__ 
  * Docker Hub  
  * Dockerfile  
  * Docker-compose  
  * Nginx  
  
__6. Проект по CI/CD__  


