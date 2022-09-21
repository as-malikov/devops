#!/bin/bash

goaccess ../04/*.log -o report.html --log-format='%h %^ %^ [%d:%t] "%r" %s %u' --date-format=%d/%m/%Y --time-format=%T