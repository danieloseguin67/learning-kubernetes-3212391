SET DOCKER_TLS_VERIFY = "1"
SET DOCKER_HOST = "tcp://127.0.0.1:56531"
SET DOCKER_CERT_PATH = "C:\Users\danie\.minikube\certs"
SET MINIKUBE_ACTIVE_DOCKERD = "minikube"

REM To point your shell to minikube's docker-daemon, run:
REM @FOR /f "tokens=*" %i IN ('minikube -p minikube docker-env --shell cmd') DO @%i
REM To point your shell to minikube's docker-daemon, run:
REM @FOR /f "tokens=*" %i IN ('minikube -p minikube docker-env --shell cmd') DO @%i