# Dockerfiles

![party](./docker-party.jpeg)

A collection of opinionated dockerfiles, Kubernetes YAML files, and scripts that I use.

| Folder               | Contains                                                                                     |
|----------------------|----------------------------------------------------------------------------------------------|
| apiscout             | Kubernetes YAML to deploy [APIScout](https://tibcosoftware.github.com/apiscout)              |
| corestack            | docker-compose file to work with my corestack of tools                                       |
| flogoweb             | Kubernetes YAML to deploy [Flogo Web](http://flogo.io) and Makefile to build a new container |
| gogs                 | Kubernetes YAML to deploy [Gogs](https://gogs.io)                                            |
| jenkins              | Makefile to build a new Jenkins container                                                    |
| kubernetes-dashboard | Kubernetes YAML to deploy [Kubernetes Dashboard](https://github.com/kubernetes/dashboard)    |
| openfaas-ec2         | Shell script to run [OpenFaaS](https://www.openfaas.com/) in Minikube on EC2                 |

## Corestack

Currently my corestack consists of:

* [Gogs](https://gogs.io)
* [Drone](https://drone.io)
* [Artifactory](https://www.jfrog.com/artifactory/)
* [Jenkins](https://jenkins.io/)
* [Nuclio](https://nuclio.io)

## License

See the [LICENSE](./LICENSE) file in the repository