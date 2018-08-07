FROM library/nginx:alpine
MAINTAINER Matt Marshall
COPY out/html /usr/share/nginx/html
