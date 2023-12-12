#!/bin/bash

# Delete the Kubernetes deployment and service
echo "Deleting Kubernetes deployment and service..."
kubectl delete deployment kanban-app
kubectl delete service kanban-app-service

# Optionally: Clean up Docker images
# This step is optional and depends on whether you want to remove the Docker image as well
echo "Removing Docker image..."
docker rmi my-kanban-app-image:latest
kubectl delete -f deployment.yaml
kubectl delete -f service.yaml
kubectl delete -f sqlite.yaml

echo "Teardown complete!"
