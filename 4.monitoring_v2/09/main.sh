#!/bin/bash
while true
do
  {
    echo -e "# HELP avg cpu load at 1 minutes\n#TYPE cpu_load_one_min gauge\n"
    < /proc/loadavg awk '{printf "cpu_usage_one_min %1.3e\n ", $1 }'
    echo -e "# HELP avg cpu load at 5 minutes\n#TYPE cpu_load_five_min gauge\n"
    < /proc/loadavg awk '{printf "cpu_usage_five_min %1.3e\n ", $2 }'
    echo -e "# HELP avg cpu load at 15 minutes\n#TYPE cpu_load_fifteen_min gauge\n"
    < /proc/loadavg awk '{printf "cpu_usage_fifteen_min %1.3e\n ", $3 }'
    echo -e "# HELP ram total \n#TYPE ram_total gauge\n"
    free -m | awk '/Mem:/ {printf "ram_total %d\n ", $2}'
    echo -e "# HELP ram used \n#TYPE ram_used gauge\n"
    free -m | awk /Mem:/'{printf "ram_used %d\n ", $3}'
    echo -e "# HELP ram free \n#TYPE ram_free gauge\n"
    free -m | awk /Mem:/'{printf "ram_free %d\n ", $4}'
    echo -e "# HELP free space \n#TYPE space_root gauge\n"
    df / | awk '/dev/ {printf "space_root %d\n ", $3/1024}'
  } > "/var/www/html/metrics/index.html"
  sleep 3
done