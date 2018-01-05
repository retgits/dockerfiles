# Usage:
# docker run -d -p 8080:8080 -p 50000:50000 \
#   -v $DOCKER_STORAGE/jenkins:/var/jenkins_home \
#   --name=jenkins retgits/jenkins
#

FROM jenkins/jenkins
LABEL maintainer "retgits"

# Switch to root to install packages
USER root
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - \
    && apt-get update \
    && apt-get install nodejs -y zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# drop back to the regular jenkins user - good practice
USER jenkins