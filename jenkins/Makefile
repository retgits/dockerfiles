# Description: Makefile for Jenkins
# Author: retgits
# Last Updated: 2019-01-12

#--- Help ---
.PHONY: help
help:
	@echo 
	@echo Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo

#--- Latest ---
.PHONY: latest
latest: ## Get the latest version
	docker pull jenkins/jenkins:latest

#--- Build ---
.PHONY: build
build: ## Build a new docker container based on jenkins/jenkins:latest
	docker build . -t retgits/jenkins

#--- Run ---
.PHONY: run
run: ## Run a container
	docker run -d -p 8080:8080 -p 50000:50000 -v $(DOCKER_STORAGE)/jenkins:/var/jenkins_home --name=jenkins retgits/jenkins

.PHONY: runint
runint: ## Run a container in interactive mode
	docker run --rm -it -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v $(DOCKER_STORAGE)/jenkins:/var/jenkins_home --name=jenkins retgits/jenkins