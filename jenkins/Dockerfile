# Usage:
# docker run -d -p 8080:8080 -p 50000:50000 \
#   -v $DOCKER_STORAGE/jenkins:/var/jenkins_home \
#   --name=jenkins retgits/jenkins
#
# docker build . -t retgits/jenkins
# 
# To update the image run
# docker stop jenkins && docker rm jenkins 
# docker rmi retgits/jenkins && docker rmi jenkins/jenkins
# docker build . -t retgits/jenkins

FROM jenkins/jenkins
LABEL maintainer "retgits"

# Environment settings
ENV GO_VERSION 1.11.4
ENV GO_LOCATION /usr/local

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# Switch to root to install packages
USER root

# Install Node.js, Go and dep
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" \
    && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
    && apt-get update \
    && apt-get install nodejs jq python-pip docker.io zip -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz \
    && tar -C $GO_LOCATION -xzf go$GO_VERSION.linux-amd64.tar.gz \
    && rm go$GO_VERSION.linux-amd64.tar.gz \
    && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    && npm install -g serverless \
    && go get -u github.com/mikefarah/yq 

# drop back to the regular jenkins user - good practice
USER jenkins
