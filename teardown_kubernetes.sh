#!/bin/bash

# Delete the Kubernetes deployment and service
echo "Deleting Kubernetes deployment and service..."
kubectl delete deployment kanban-app
kubectl delete service kanban-app-service

# Optionally: Clean up Docker images
# This step is optional and depends on whether you want to remove the Docker image as well
echo "Removing Docker image..."
docker rmi your-kanban-app-image:latest

echo "Teardown complete!"
