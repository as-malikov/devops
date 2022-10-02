FROM nginx:latest

USER root

RUN apt-get update && apt-get -y install libfcgi-dev spawn-fcgi \
    && rm -rf /var/lib/apt/lists

WORKDIR /app

COPY nginx.conf /etc/nginx/

COPY . .

RUN useradd -d /home/my-nginx -s /bin/bash my-nginx; \
touch /var/run/nginx.pid; \
chown -R my-nginx:my-nginx /var/run/nginx.pid; \
chown -R my-nginx:my-nginx /etc/nginx/conf.d; \
chown -R my-nginx:my-nginx /var/log/nginx; \
chown -R my-nginx:my-nginx /var/cache/nginx; \
chown -R my-nginx:my-nginx /app/run.sh;

USER my-nginx

CMD [ "./run.sh" ]