# Description: Makefile
# Author: retgits
# Last Updated: 2019-02-12

.PHONY: help
help: ## Displays the help for each target (this message)
	@echo 
	@echo Makefile targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo 

.PHONY: dashboard-deploy
dashboard-deploy: ## Deploy the Kubernetes Dashboard (using Helm)
	helm install stable/kubernetes-dashboard --name kube-dashboard

.PHONY: dashboard-undeploy
dashboard-undeploy: ## Remove the Kubernetes Dashboard (using Helm)
	helm uninstall kube-dashboard --purge

.PHONY: gogs-pull
gogs-pull: ## Pull a version of Gogs from Docker Hub (make pull TAG=latest)
	docker pull gogs/gogs:$(TAG)

.PHONY: gogs-deploy
gogs-deploy: ## Deploy Gogs to Kubernetes
	kubectl apply -f gogs/gogs.yaml

.PHONY: gogs-undeploy
gogs-undeploy: ## Remove Gogs from Kubernetes
	kubectl delete service gogs
	kubectl delete service gogs-ui
	kubectl delete statefulset gogs
	kubectl delete pvc gogs-storage
	kubectl delete ingress gogs-ingress

.PHONY: jumppod-pull
jumppod-pull: ## Pull version 3.9 of Alpine from Docker Hub
	docker pull alpine:3.9

.PHONY: jumppod-deploy
jumppod-deploy: ## Deploy jumppod to Kubernetes
	kubectl apply -f jumppod/jumppod.yaml

.PHONY: jumppod-undeploy
jumppod-undeploy: ## Remove jumppod from Kubernetes
	kubectl delete pod jumppod

.PHONY: minikube-install
minikube-install: ## Install Minikube
	curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube
	curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && sudo cp kubectl /usr/local/bin/ && rm kubectl
	export MINIKUBE_WANTUPDATENOTIFICATION=false
	echo "export MINIKUBE_WANTREPORTERRORPROMPT=false" >> ~/.profile
	echo "export MINIKUBE_HOME=$$HOME" >> ~/.profile
	echo "export CHANGE_MINIKUBE_NONE_USER=true" >> ~/.profile
	echo "export KUBECONFIG=$$HOME/.kube/config" >> ~/.profile
	mkdir -p $$HOME/.kube
	mkdir -p $$HOME/.minikube
	touch $$HOME/.kube/config

.PHONY: minikube-start
minikube-start: ## Start Minikube
	sudo -E minikube start --vm-driver=none --extra-config=apiserver.enable-admission-plugins="LimitRanger,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,DefaultStorageClass,MutatingAdmissionWebhook"

.PHONY: minikube-stop
minikube-stop: ## Stop Minikube
	sudo -E minikube stop

.PHONY: minikube-delete
minikube-delete: ## Remove Minikube completely from the host system (including kubectl)
	sudo rm -rf ~/.minikube/ ~/.kube/ /data/minikube /etc/kubernetes/ /var/lib/minikube /var/lib/kube* $(which kubelet) $(which kubeadm) $(which kubectl) $(which minikube)

.PHONY: minikube-ingress
minikube-ingress: ## Set up ingress for Minikube based on nginx
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
	sudo -E minikube addons enable ingress
	kubectl get pods -n ingress-nginx

.PHONY: openfaas-deploy
openfaas-deploy: ## Deploy OpenFaaS to Kubernetes (make openfaas-deploy PW=mypassword) (using Helm)
	helm repo add openfaas https://openfaas.github.io/faas-netes/
	kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
	kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=admin --from-literal=basic-auth-password="$(PW)"
	helm repo update && helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set basic_auth=true --set functionNamespace=openfaas-fn --set faasIdler.image=openfaas/faas-idler:0.2.0 --set faasIdler.inactivityDuration=2m --set faasIdler.reconcileInterval=20s --set faasIdler.dryRun=false
	@echo Now you can deploy apps with the sero scaling label like
	@echo faas-cli store deploy figlet --label "com.openfaas.scale.zero=true"

.PHONY: openfaas-undeploy
openfaas-undeploy: ## Remove OpenFaaS from Kubernetes (using Helm)
	helm delete openfaas --purge

.PHONY: vault-pull
vault-pull: ## Pull a version of Vault from Docker Hub (make pull TAG=latest)
	docker pull vault:$(TAG)

.PHONY: vault-deploy
vault-deploy: ## Deploy Vault to Kubernetes
	kubectl apply -f vault/vault.yaml

.PHONY: vault-undeploy
vault-undeploy: ## Remove Vault from Kubernetes
	kubectl delete service vault
	kubectl delete service vault-ui
	kubectl delete statefulset vault
	kubectl delete configmap vault-local-config
	kubectl delete pvc vault-storage
	kubectl delete ingress vault-ingress

.PHONY: apiscout-deploy
apiscout-deploy: ## Deploy APIScout to Kubernetes
	kubectl apply -f apiscout/apiscout.yml

.PHONY: apiscout-undeploy
apiscout-undeploy: ## Remove APIScout from Kubernetes
	kubectl delete clusterrolebinding default-view
	kubectl delete deployment apiscout
	kubectl delete service apiscout-svc