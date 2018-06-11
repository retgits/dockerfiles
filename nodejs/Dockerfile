# Usage:
# docker run -it --rm retgits/node /bin/sh
#
# Or create a executable file with
# ===
# #!/bin/bash
# docker run --rm -it --volume ${PWD}:/root/work retgits/node "$@"
# ===
# With this you can run the docker container as a command
#
#
# Build:
# docker build . -t retgits/node

FROM node:10-alpine
LABEL maintainer "retgits"

RUN mkdir -p /root/work

WORKDIR /root/work
