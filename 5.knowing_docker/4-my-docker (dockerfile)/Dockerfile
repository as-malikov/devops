FROM nginx:latest

RUN apt-get update && apt-get -y install libfcgi-dev spawn-fcgi

WORKDIR /app

COPY nginx.conf /etc/nginx/

COPY . .

CMD [ "./run.sh" ]
