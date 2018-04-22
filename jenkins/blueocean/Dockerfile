FROM jenkinsci/blueocean
LABEL maintainer "retgits"

# Switch to root to install packages
USER root

# Install packages
RUN apk update \
    && apk add --update --no-cache bash gcc musl-dev openssl go git nodejs nodejs-npm \
    && npm install -g serverless

# drop back to the regular jenkins user - good practice
USER jenkins

# Update environment settings
RUN export GOPATH=/var/jenkins_home/go && export PATH=$GOPATH/bin:$PATH
