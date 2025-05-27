# start kubernetes
minikube start 

# check nodes and namespaces
kubectl get nodes
kubectl get namespaces

# Pods found in  default namespace which corresponds to the control plane
kubectl get pods -A

# Services act as load balancer
kubectl get services -A

# validate the yaml files for namespace, service, and deployment
# via the site:  https://yamlchecker.com/

# apply the yaml files
kubectl apply -f namespace.yaml
kubectl apply -f seguindev-websites.yaml
kubectl apply -f seguindev-service.yaml

# re-check the pods and serviceso
kubectl get pods -A
kubectl get services -A

# when development done and changes made to it, it is better to do the following
kubectl delete deployment seguindev-websites -n development
kubectl apply -f seguindev-websites.yaml
kubectl delete service seguindev-websites -n development
kubectl apply -f seguindev-service.yaml

kubectl get pods -l run=seguindev-websites -n development -o wide

get svc -n development seguindev-websites
kubectl describe svc -n development seguindev-websites

# check ip address of the kube
minikube ip

# to make website accessible from outside the cluster, we need to use a load balancer
# option 1:
# to setup docker environment within minikube
minikube docker-env and update in the setdocker.ps1 file
# cd learning-kubernetes-3212391/exercise-files/exercise-files/seguindev
# run setdocker.ps1
# rebuild the image: docker build -t adventurework:0.0.2 where the Dockerfile is located
# then apply the deployment file with new image location
minikube ip
kubectl get nodes -o wide
minikube service seguindev-websites -n development
# http://<NODE-IP>:30080


# option 2: as by default the type of service is ClusterIP
kubectl port-forward svc/seguindev-websites 8080:80 -n development
# go localhost:8080 and yeah works!

# option 3:  use tunnel  to access the service
# might have to change service type to LoadBalancer
minikube tunnel

# delte the namespace, service, and deployment
kubectl delete -f seguindev-deployment.yaml
kubectl delete -f seguindev-service.yaml
kubectl delete -f busybox.yaml
kubectl delete -f namespace.yaml

# delete minikube cluster
minikube delete

# check logs when container is not running
kubectl get pods -A
kubectl logs seguindev-websites-64bfd5bdc-gjsvm -n development -c adventurework
kubectl logs seguindev-websites-64bfd5bdc-gjsvm -n development -c consultantcompanion
