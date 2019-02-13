# Usage:
# docker run -d -p 80:80 --name=nginx-proxy retgits/nginx-proxy
#
# docker build . -t retgits/nginx-proxy

FROM nginx:alpine
LABEL maintainer "retgits"

COPY default.conf /etc/nginx/conf.d/