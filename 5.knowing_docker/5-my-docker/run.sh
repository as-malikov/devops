#!/bin/bash

    FCGI="spawn-fcgi -a 127.0.0.1 -p 8080 -f /app/main"
    ${FCGI}
    NGINX="service nginx start"
    ${NGINX}

    while [[ 1 ]]; do
        echo "Nginx is running..."
    done
