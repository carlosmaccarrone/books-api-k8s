#!/bin/bash
set -e  # stops if something goes wrong

echo "Pointing Docker to Minikube..."
eval $(minikube docker-env)

echo "Building a database image..."
cd db
docker build -t library-db:latest .

echo "Building the Node backend image..."
cd ../backend-nodejs
docker build -t library-node:latest .

echo "Applying Deployment and Service to the DB..."
kubectl apply -f ../k8s/db-deployment.yaml
kubectl apply -f ../k8s/db-service.yaml

echo "Waiting for the database to be ready..."
until kubectl get pods -l app=postgres -o jsonpath="{.items[0].status.containerStatuses[0].ready}" | grep true > /dev/null; do
  sleep 2
done

echo "Applying Deployment and Service to the backend..."
kubectl apply -f ../k8s/backend-node-deployment.yaml
kubectl apply -f ../k8s/backend-node-service.yaml

echo "¡Everything deployed!"
kubectl get pods
kubectl get svc