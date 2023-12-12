#!/bin/bash

# Set Docker environment to Minikube's Docker daemon
echo "Setting Docker environment to Minikube's Docker daemon..."
eval $(minikube docker-env)

# Build the Docker image
echo "Building Docker image..."
# docker build -t my-flask-app .
docker build --no-cache -t your-kanban-app-image .    

# Apply the Kubernetes configurations
echo "Applying Kubernetes deployments and services..."
kubectl apply -f deployment.yaml
# TODO: add dynamic scaling
# kubectl apply -f automatic_scaling_deployment.yaml 
kubectl apply -f service.yaml

echo "Setup complete!"
