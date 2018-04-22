# Usage:
# docker run -d -p 8888:8888 \
# -v $DOCKER_STORAGE/jupyter:/home/gopher/work \
# retgits/gonode-notebook
#
# docker build . -t retgits/gonode-notebook
FROM retgits/go-notebook
LABEL maintainer "retgits"

# Change to root to install new packages
USER root

# Install Node.js and the IJavaScript kernel
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && apt-get install -y nodejs && mkdir ~/.npm-global && npm config set prefix '~/.npm-global' && export PATH=~/.npm-global/bin:$PATH && npm install -g --unsafe-perm ijavascript
RUN /home/gopher/.npm-global/bin/ijsinstall

# Return to original user
USER gopher
WORKDIR /home/gopher

CMD ["jupyter", "notebook", "--ip=0.0.0.0"]