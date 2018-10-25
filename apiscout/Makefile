# Description: Makefile for API Scout
# Author: retgits
# Last Updated: 2018-10-24

#--- Help ---
.PHONY: help
help:
	@echo 
	@echo Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo

#--- Kube Deploy ---
.PHONY: kubedeploy
kubedeploy: ## Deploy to Kubernetes
	kubectl apply -f apiscout.yml

#--- Kube Undeploy ---
.PHONY: kubeundeploy
kubeundeploy: ## Remove from Kubernetes
	kubectl delete clusterrolebinding default-view
	kubectl delete deployment apiscout
	kubectl delete service apiscout-svc
