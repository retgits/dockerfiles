# Description: Makefile for Kubernetes Dashboard
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
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml && kubectl apply -f dashboard.yml

#--- Kube Undeploy ---
.PHONY: kubeundeploy
kubeundeploy: ## Remove from Kubernetes
	kubectl delete secret kubernetes-dashboard-certs
	kubectl delete serviceaccount kubernetes-dashboard
	kubectl delete role kubernetes-dashboard-minimal
	kubectl delete rolebinding kubernetes-dashboard-minimal
	kubectl delete deployment kubernetes-dashboard
	kubectl delete service kubernetes-dashboard
	kubectl delete service kubernetes-dashboard-nodeport