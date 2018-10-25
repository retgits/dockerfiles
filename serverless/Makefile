# Description: Makefile for Serverless Framework
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
	docker pull node:10-alpine

#--- Build ---
.PHONY: build
build: ## Build a new docker container based on node:10-alpine
	docker build . -t retgits/serverless

#--- Run ---
.PHONY: run
run: ## Run a container
	docker run -it --rm retgits/serverless /bin/sh