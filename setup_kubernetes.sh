#!/bin/bash

# Set Docker environment to Minikube's Docker daemon
echo "👷‍♀️Setting Docker environment to Minikube's Docker daemon..."
eval $(minikube docker-env)

# Build the Docker image
echo "👷‍♀️Building Docker image..."
# docker build -t my-flask-app .
docker build -t sqlite-image:latest .
docker build -t my-kanban-app-image .  
    

# Apply the Kubernetes configurations
echo "👷‍♀️Applying Kubernetes deployments and services..."
echo "👷‍♀️Deploy database..."
kubectl apply -f sqlite.yaml

echo "⏳Waiting for database to be set up..."
sleep 10

echo "👷‍♀️Deploy kanban board..."
kubectl apply -f deployment.yaml
# TODO: add dynamic scaling
# kubectl apply -f automatic_scaling_deployment.yaml 
kubectl apply -f service.yaml

echo "⏳Waiting for Kanban board to be set up..."
sleep 10
echo "Setup complete!"

echo "✅Get Kanban board from url..."
minikube service kanban-app-service --url