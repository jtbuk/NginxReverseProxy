FROM nginx:stable-alpine as run

RUN apk upgrade --update-cache --available && apk add openssl && rm -rf /var/cache/apk/*
RUN rm -rf /usr/share/nginx/html/*

COPY admin-my-website.conf /etc/nginx/conf.d/