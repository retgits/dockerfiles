# Usage:
# docker run -it --rm retgits/traviscli /bin/bash
#
# Or create a executable file with
# ===
# #!/bin/bash
# docker run --rm --volume ${PWD}:/root/work retgits/traviscli "$@"
# ===
# With this you can run the docker container as a command
#
#
# Build:
# docker build . -t retgits/traviscli

FROM ruby:2.6-rc-slim-stretch
LABEL maintainer "retgits"

RUN apt-get update \
  && apt-get install -y build-essential git \
  && rm -rf /var/lib/apt/lists/* \
  && gem install travis -v 1.8.8 --no-rdoc --no-ri \
  && mkdir -p /root/work

WORKDIR /root/work
