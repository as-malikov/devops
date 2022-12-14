#!/bin/bash

start="\033[32m"
stop="\033[0m"

echo -e "Total number of folders (including all nested ones) = ${start}$COUNT_DIR${stop}"
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo -e "${start}$TOP_5_DIR${stop}"
echo -e "etc up to 5"
echo -e "Total number of files = ${start}$COUNT_FILES${stop}"
echo -e "Number of:"
echo -e "Configuration files (with the .conf extension) = ${start}$COUNT_FILES_CONF${stop}"
echo -e "Text files = ${start}$COUNT_FILES_TXT${stop}"
echo -e "Executable files = ${start}$COUNT_FILES_EXEC${stop}"
echo -e "Log files (with the extension .log) = ${start}$COUNT_FILES_LOG${stop}"
echo -e "Archive files = ${start}$COUNT_FILES_ARCH${stop}"
echo -e "Symbolic links = ${start}$COUNT_FILES_LINKS${stop}"
echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo -e "${start}$TOP_10_FILES${stop}"
echo -e "etc up to 10"
echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
echo -e "${start}$TOP_10_EXEC${stop}"
echo -e "etc up to 10"