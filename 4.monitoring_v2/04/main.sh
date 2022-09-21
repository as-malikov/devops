#!/bin/bash

# 200 - OK. The request succeeded.
# 201 - Created. The request succeeded, and a new resource was created as a result. 
# 400 - Bad Request. The server cannot or will not process the request due to something that is perceived to be a client error.
# 401 - Unauthorized. Although the HTTP standard specifies "unauthorized", semantically this response means "unauthenticated".
# 403 - Forbidden. The client does not have access rights to the content; that is, it is unauthorized, so the server is refusing to give the requested resource.
# 404 - Not Found. The server can not find the requested resource.
# 500 - Internal Server Error. The server has encountered a situation it does not know how to handle.
# 501 - Not Implemented. The request method is not supported by the server and cannot be handled.
# 502 - Bad Gateway. This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response.
# 503 - Service Unavailable. The server is not ready to handle the request.

if ! [ -n "${1}" ]; then
    i=0
    while [ ${i} -lt 5 ]
    do
        ./logic.sh ${i}
        i=$(( $i + 1 ))
    done
else
    echo "Error param..."
fi