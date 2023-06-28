#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="manhsech/manhdd17-capstone:latest"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy manhdd17-capstone --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods
POD_NAME=`kubectl get pod | grep manhdd17-capstone | sed 's/ .*//'`

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/$POD_NAME --address 0.0.0.0 8000:80