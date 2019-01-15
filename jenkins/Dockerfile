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
ENV NODE_VERSION 11
ENV GO_VERSION 1.11.4
ENV GO_LOCATION /usr/local
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV JENKINS_OPTS="--prefix=/jenkins"

# Switch to root to install packages
USER root

# Install tools
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" \
    && curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \
    && apt-get update \
    && apt-get install nodejs jq python-pip zip apt-transport-https ca-certificates wget software-properties-common -y \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install docker-ce -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && usermod -a -G docker jenkins \
    && wget https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz \
    && tar -C $GO_LOCATION -xzf go$GO_VERSION.linux-amd64.tar.gz \
    && rm go$GO_VERSION.linux-amd64.tar.gz \
    && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    && touch /var/run/docker.sock \
    && chmod 777 /var/run/docker.sock

# drop back to the regular jenkins user - good practice
USER jenkins
