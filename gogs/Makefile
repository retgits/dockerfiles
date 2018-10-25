# Description: Makefile for Gogs
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
	docker pull gogs/gogs:latest

#--- Run ---
.PHONY: run
run: ## Run a container
	docker run -d -p 3000:3000 -p 10022:22 -v $(DOCKER_STORAGE)/gogs:/data --name=gogs gogs/gogs:latest

#--- Kube Deploy ---
.PHONY: kubedeploy
kubedeploy: ## Deploy to Kubernetes
	kubectl apply -f gogs.yml

#--- Kube Undeploy ---
.PHONY: kubeundeploy
kubeundeploy: ## Remove from Kubernetes
	kubectl delete deployment gogs
	kubectl delete service gogs-http