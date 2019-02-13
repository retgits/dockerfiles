# Dockerfiles

![party](./docker-party.jpeg)

## Docker

| Folder               | Contains                                                                                                                   |
|----------------------|----------------------------------------------------------------------------------------------------------------------------|
| flogoweb             | Kubernetes YAML to deploy [Flogo Web](http://flogo.io) and Makefile to build a new container                               |
| goc                  | Dockerfile to create the image for the [GoCenter GitHub Action](https://github.com/retgits/actions/tree/master/gocenter)   |
| jenkins              | Makefile to build a new Jenkins container                                                                                  |
| jfrog-cli            | Dockerfile to create the image for the [JFrog-CLI GitHub Action](https://github.com/retgits/actions/tree/master/jfrog-cli) |
| nginx-proxy          | Dockerfile to create a simple nginx container that can serve as a reverse proxy                                            |

## Kubernetes

The Kubernetes folder has a `Makefile` that contains a bunch of actions I use to set up my Minikube and testing clusters

| Makefile targets  | Description                                                                     |
|-------------------|---------------------------------------------------------------------------------|
| apiscout-deploy   | Deploy [APIScout](https://tibcosoftware.github.com/apiscout) to Kubernetes      |
| apiscout-undeploy | Remove [APIScout](https://tibcosoftware.github.com/apiscout) from Kubernetes    |
| dashboard-deploy  | Deploy the Kubernetes Dashboard (using Helm)                                    |
| dashboard-undeploy| Remove the Kubernetes Dashboard (using Helm)                                    |
| gogs-deploy       | Deploy Gogs to Kubernetes                                                       |
| gogs-pull         | Pull a version of Gogs from Docker Hub (make pull TAG=latest)                   |
| gogs-undeploy     | Remove Gogs from Kubernetes                                                     |
| help              | Displays the help for each target (this message)                                |
| jumppod-deploy    | Deploy jumppod to Kubernetes                                                    |
| jumppod-pull      | Pull version 3.9 of Alpine from Docker Hub                                      |
| jumppod-undeploy  | Remove jumppod from Kubernetes                                                  |
| minikube-delete   | Remove Minikube completely from the host system (including kubectl)             |
| minikube-ingress  | Set up ingress for Minikube based on nginx                                      |
| minikube-install  | Install Minikube                                                                |
| minikube-start    | Start Minikube                                                                  |
| minikube-stop     | Stop Minikube                                                                   |
| openfaas-deploy   | Deploy OpenFaaS to Kubernetes (make openfaas-deploy PW=mypassword) (using Helm) |
| openfaas-undeploy | Remove OpenFaaS from Kubernetes (using Helm)                                    |
| vault-deploy      | Deploy Vault to Kubernetes                                                      |
| vault-pull        | Pull a version of Vault from Docker Hub (make pull TAG=latest)                  |
| vault-undeploy    | Remove Vault from Kubernetes                                                    |

## License

See the [LICENSE](./LICENSE) file in the repository