# Description: Makefile for nginx-proxy
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
	docker pull nginx:alpine

#--- Build ---
.PHONY: build
build: ## Build a new docker container based on nginx:alpine
	docker build . -t retgits/nginx-proxy

#--- Run ---
.PHONY: run
run: ## Run a container
	docker run -d -p 80:80 -v $(DOCKER_STORAGE)/nginx:/etc/nginx/conf.d/ --name=nginx-proxy retgits/nginx-proxy

.PHONY: runint
runint: ## Run a container in interactive mode
	docker run --rm -it -p 80:80 -v $(DOCKER_STORAGE)/nginx:/etc/nginx/conf.d/ --name=nginx-proxy retgits/nginx-proxy