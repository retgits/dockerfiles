# Usage:
# docker run -it --rm retgits/serverless /bin/sh
#
# Or create a executable file with
# ===
# #!/bin/bash
# docker run --rm -it --volume ${PWD}:/root/work retgits/serverless "$@"
# ===
# With this you can run the docker container as a command
#
#
# Build:
# docker build . -t retgits/serverless

FROM node:10-alpine
LABEL maintainer "retgits"

RUN mkdir -p /root/work && npm install -g serverless

WORKDIR /root/work
