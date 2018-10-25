# Description: Makefile for Flogo Web 
# Author: retgits
# Last Updated: 2018-10-24

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
	docker pull flogo/flogo-docker:latest

#--- Build ---
.PHONY: build
build: ## Build a new docker container based on flogo/flogo-docker:latest
	docker build . -t retgits/flogo

#--- Run ---
.PHONY: run
run: ## Run a container
	docker run -d -p 3303:3303 --name=flogoweb retgits/flogo:latest eula-accept

#--- Kube Deploy ---
.PHONY: kubedeploy
kubedeploy: ## Deploy to Kubernetes
	kubectl apply -f flogoweb.yml

#--- Kube Undeploy ---
.PHONY: kubeundeploy
kubeundeploy: ## Remove from Kubernetes
	kubectl delete deployment flogoweb
	kubectl delete service flogoweb