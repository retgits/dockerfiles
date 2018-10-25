#!/usr/bin/bash

###
# Installation script for Kubernetes and OpenFaas on Amazon EC2
#
# References
# http://dreamcloud.artark.ca/docker-hands-on-guide-docker-and-minikube-on-aws-ec2/
# https://github.com/robertluwang/docker-hands-on-guide/blob/master/minikube-none-installation.md
# https://github.com/openfaas/faas/blob/master/guide/deployment_k8s.md
#
# Last update: Feb 2, 2018
###

prerequisites () {
    ### Update packages
    sudo yum update -y

    ### Set the default system editor for this user to nano
    export EDITOR=nano

    ### Install required packages
    sudo yum install -y docker dos2unix git

    ### Start Docker service
    sudo service docker start
    sudo usermod -a -G docker ec2-user

    ### Alert user to update paths
    echo Update the secure_path of sudo config to add :/usr/local/bin at the end
    echo you can use the command sudo -E visudo
}

install () {
    ### This is where we start
    echo Starting installation at `date`
    echo

    ### Clean up old binaries
    echo Search for existing binaries ...
    if [ -f /usr/local/bin/minikube ]; then
        echo Found an existing minikube binary, changing it to minikube.old
        sudo mv /usr/local/bin/minikube /usr/local/bin/minikube.old
    fi

    if [ -f /usr/local/bin/kubectl ]; then
        echo Found an existing kubectl binary, changing it to kubectl.old
        sudo mv /usr/local/bin/kubectl /usr/local/bin/kubectl.old
    fi

    if [ -f /usr/local/bin/localkube ]; then
        echo Found an existing localkube binary, changing it to localkube.old
        sudo mv /usr/local/bin/localkube /usr/local/bin/localkube.old
    fi

    ### Downloading new binaries
    echo
    echo Downloading the latest version of minikube ...
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube
    sudo mv minikube /usr/local/bin

    echo 
    echo Downloading the latest version of kubectl ...
    curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin

    ### Getting ready for minikube
    echo
    echo setup MINIKUBE env ...
    export MINIKUBE_WANTUPDATENOTIFICATION=true
    export MINIKUBE_WANTREPORTERRORPROMPT=false
    export MINIKUBE_HOME=$HOME
    export CHANGE_MINIKUBE_NONE_USER=true
    if [ -d $HOME/.kube ]; then
        sudo rm -r $HOME/.kube
    else
        mkdir $HOME/.kube
        touch $HOME/.kube/config
        export KUBECONFIG=$HOME/.kube/config
    fi

    if [ -d $HOME/.minikube ]; then
        sudo rm -r $HOME/.minikube
    fi

    ### Installing minikube
    echo 
    echo Starting minikube with none vm driver ...
    sudo -E minikube start --vm-driver=none

    sudo chmod +x /usr/local/bin/localkube

    ### Verify minikube status
    minikube status

    ### Done installing minikube
    echo 
    echo Completed minikube installation at `date` 

    ### Get OpenFaas
    echo
    echo Continuing installation of OpenFaas using faas-netes

    cd ~
    git clone https://github.com/openfaas/faas-netes

    ### Installing OpenFaas
    cd ~/faas-netes
    kubectl apply -f ./namespaces.yml
    kubectl apply -f ./yaml

    echo 
    echo Completed OpenFaas installation at `date` 

    ### Closing remarks
    echo Make sure that the following ports are accessible from your IP address only because RBAC is not enabled:
    echo Kubernetes UI: 30000
    echo API Gateway / UI: 31112
    echo Prometheus: 31119
}

case "$1" in 
    "prerequisites")
        prerequisites
        ;;
    "install")
        install
        ;;
    *)
        echo "The target {$1} you want to execute doesn't exist"
        echo ""
        echo "Usage:"
        echo "./`basename "$0"` [target]"
        echo ""
        echo "Possible targets are"
        echo "  prerequisites : Install the prerequisites on Amazon EC2"
        echo "  install       : Install OpenFaas"
esac