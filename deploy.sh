#!/bin/bash

# Variables
IMAGE_NAME="hello-world"
IMAGE_TAG="latest"
TARGET_SERVER="3.110.186.100"
TARGET_DIRECTORY="/home/Desktop/zenassignment"

# Copy Docker image to the target server
echo "Copying Docker image to the server..."
docker save "$IMAGE_NAME:$IMAGE_TAG" | ssh "$TARGET_SERVER" "docker load"

# Deploy Docker image on the target server
echo "Deploying Docker image on the server..."
ssh "$TARGET_SERVER" "docker run -d --name myapp-container -p 80:80 $IMAGE_NAME:$IMAGE_TAG"

echo "Deployment completed successfully."

