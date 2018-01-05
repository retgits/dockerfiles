# Usage:
# docker run -d -p 8888:8888 \
# -v $DOCKER_STORAGE/jupyter:/home/jovyan/work \
# retgits/nodejs-notebook
#
FROM jupyter/minimal-notebook
LABEL maintainer "retgits"

# Switch to root to install packages
USER root
RUN npm install -g ijavascript \
    && ijsinstall \
    && chown -R jovyan.users .npm/ \
    && chown -R jovyan.users .local/

# drop back to the regular jovyan user - good practice
USER jovyan