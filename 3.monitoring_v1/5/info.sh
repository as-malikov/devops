#!/bin/bash

path=${1}

export COUNT_DIR=$(find ${path} -type d | wc -l | awk '{print $1}')
export TOP_5_DIR=$(du -h ${path} | sort -nr | head -n 5 | awk '{print NR, $2 ", " $1}')
export COUNT_FILES=$(find ${path} -type f | wc | awk '{print $1}')
export COUNT_FILES_CONF=$(find ${path} -name "*.conf" | wc -l | cut -f 1)
export COUNT_FILES_TXT=$(find ${path} | xargs file {} + | grep "ASCII text" | wc -l | cut -f 1)
export COUNT_FILES_EXEC=$(find ${path} | xargs file {} + | grep executable | wc -l | cut -f 1)
export COUNT_FILES_LOG=$(find ${path} -name "*.log" | wc -l | cut -f 1)
export COUNT_FILES_ARCH=$(find ${path} | xargs file {} + | grep -e compressed -e archive | wc -l | cut -f 1)
export COUNT_FILES_LINKS=$(find ${path} -type l | wc -l | cut -f 1)

export TOP_10_FILES=$(find ${path} -type f -exec du -h {} + |sort -rh | head -10 | awk '{"file --mime-type -b " $2 | getline type_file; print NR, $2", " $1", " type_file}')
export TOP_10_EXEC=$(find ${path} -executable -type f -exec du -h {} + | sort -rh | head -10 | awk '{"md5sum "$2 | getline a; print $2",", $1",", a}' | awk '{print NR " - " $1, $2, $3}')