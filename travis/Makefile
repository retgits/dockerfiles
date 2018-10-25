# Description: Makefile for the Travis CI CLI
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
	docker pull ruby:2.6-rc-slim-stretch

#--- Build ---
.PHONY: build
build: ## Build a new docker container based on ruby:2.6-rc-slim-stretch
	docker build . -t retgits/traviscli

#--- Run ---
.PHONY: run
run: ## Run a container
	docker run -it --rm retgits/traviscli /bin/bash