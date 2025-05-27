
minikube start
kubectl get nodes
kubectl get namespaces

Pods contain containers
kubectl get pods -A

Services act as load balancer
kubectl get services -A

yaml checker 
https://yamlchecker.com/ 

kubectl get namespaces

Create a namespace 
We add development, test, production in same file
kubectl apply -f namespace.yaml 

kubectl delete -f namespace.ymal

Create deployment ymal file
kubectl apply -f deployment.ymal

Check deployments
kubectl get deployments -n development

This corresponds to number of replicas 
kubectl get pods -n development 

kubectl delete pod [id] -n development

Check the health of a pod by looking at the event logs:
kubectl get pods -n development 
get the id of the we need to check
kubectl describe pod [id] -n development
a
Create the busybox
kubectl apply -f busybox.yaml
kubectl get pods
kubectl get pods -n developement -o wide

kubectl exec -it busybox-58c58cbccf-lbz25 -- /bin/sh
when in the shell
wget [ip address]:3000 where the 3000 is in the busybox ymal file

view application logs
kubectl get pods -n development
get id of the pod
kubectl logs [id] -n development

Kubernetes service to deploy website on the web
create service.yaml 

In one terminal:

need to create tunnel
minikube tunnel

in a different terminal to create service
kubectl apply -f service.yaml

kubectl get services -n development

and go to a browser on computer and go to the external ip address
with mini kube, it will 127.0.0.0
but on a cloud service like AKS it will be an internet ip address


Add resource requests and limits to your pod:

apply in the deployment.yaml using info from the kubernetes doc website

kubectrl apply -f deployment.yaml 

kubectl get pods -n develop,emt 


destroy objects created

kubectrl delete -f busybox.yaml
kubectrl delete -f deployment.yaml
kubectrl delete -f quote.yaml
kubectrl delete -f service.yaml
kubectrl delete -f namespace.yaml

minikube delete

kubectl api-resources

kubectrl get pods -n kube-system 

kubectl logs etcd-minikube -n kube-system | jq .
