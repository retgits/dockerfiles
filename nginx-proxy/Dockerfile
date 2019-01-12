# Usage:
# docker run -d -p 80:80 -v $(DOCKER_STORAGE)/nginx:/etc/nginx/conf.d/ \
# --name=nginx-proxy retgits/nginx-proxy
#
# docker build . -t retgits/nginx-proxy

FROM nginx:alpine
LABEL maintainer "retgits"

# Copy file
COPY start.sh waiter.sh /

# Install tools
RUN apk add --no-cache nano inotify-tools \
    && chmod +x start.sh \
    && chmod +x waiter.sh

# Override the command
CMD ["./start.sh"]