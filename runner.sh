#!/usr/bin/env bash

# Description: `runner` handles installation, updates, things like that..
# Author: retgits <lstigter@gmail.com>
# Last Updated: 2018-12-21

#--- Variables ---
STORAGE_HOME=/home/leons/Documents/storage
CURR_HOME=`pwd`

#--- Build ---
build () {
    container=$1
    cd $DOCKER_FILES_HOME/$container
    make latest
    make build
}

#--- Install ---
install () {
    #--- Create directories ---
    mkdir -p $STORAGE_HOME/gogs
    mkdir -p $STORAGE_HOME/drone
    mkdir -p $STORAGE_HOME/nuclio
    mkdir -p $STORAGE_HOME/jenkins
    mkdir -p $STORAGE_HOME/artifactory
    chmod -R 777 artifactory

    #--- Install docker and compose ---
    sudo apt-get install -y docker.io curl
    sudo groupadd docker
    sudo gpasswd -a $USER docker
    sudo curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/bash/docker -o /etc/bash_completion.d/docker.sh
    newgrp docker
    sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

    #--- Install Minikube ---
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo install minikube-linux-amd64 /usr/local/bin/minikube
    curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64/kubectl && chmod +x kubectl && sudo cp kubectl /usr/local/bin/ && rm kubectl
    export MINIKUBE_HOME=$HOME
    export CHANGE_MINIKUBE_NONE_USER=true
    mkdir -p $HOME/.kube
    mkdir -p $HOME/.minikube
    touch $HOME/.kube/config
    export KUBECONFIG=$HOME/.kube/config

    #--- Update .profile ---
    echo "# Set the storage directory" >> .profile
    echo "export STORAGE_HOME=$STORAGE_HOME" >> .profile
    echo "# Set the docker files directory" >> .profile
    echo "export DOCKER_FILES_HOME=$SCURR_HOME" >> .profile
    echo "# Minikube settings" >> .profile
    echo "export MINIKUBE_HOME=$HOME" >> .profile
    echo "export CHANGE_MINIKUBE_NONE_USER=true" >> .profile
    echo "export KUBECONFIG=$HOME/.kube/config" >> .profile
    echo "export PATH=$HOME/bin:'$PATH'" >> .profile
    mkdir -p $HOME/bin
    ln -s "$CURR_HOME/runner.sh" "$HOME/bin/runner"

    #--- Alert user to update files ---
    echo "please update /etc/hostname with the hostname (like ubudevrel)"
    echo "please update /etc/hosts with the ip address of the server and" 
    echo "the FQDN (like 10.0.0.1 ubudevrel.local ubudevrel)"
    echo "after that run the command systemctl restart systemd-logind.service"
}

#--- Start ---
start () {
    cd $DOCKER_FILES_HOME/corestack
    export HOST=`hostname -f`
    docker-compose up -d
}

#--- Stop ---
stop () {
    cd $DOCKER_FILES_HOME/corestack
    export HOST=`hostname -f`
    docker-compose stop
}

case "$1" in 
    "--build" | "-b")
        build $2
        ;;
    "--install" | "-i")
        install
        ;;
    "--start" | "-s")
        start
        ;;
    "--stop")
        stop
        ;;
    *)
        echo "The target {$1} you want to execute doesn't exist"
        echo ""
        echo "Usage:"
        echo "./`basename "$0"` [target]"
        echo ""
        echo "Possible targets are"
        echo "  -b, --build [container] : Build a new container"
        echo "  -i, --install           : Install all prerequisites"
        echo "  -s, --start             : Start the stack using docker compose"
        echo "      --stop              : Stop the stack using docker compose"
esac