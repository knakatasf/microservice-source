#!/bin/sh
set -e  # Stop on error

echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region us-east-1 \
    | docker login --username AWS --password-stdin \
    793261838120.dkr.ecr.us-east-1.amazonaws.com/

SERVICES="frontend-service catalog-service customer-service order-service"

for SERVICE in $SERVICES; do
  IMAGE_TAG=793261838120.dkr.ecr.us-east-1.amazonaws.com/$SERVICE:latest

  echo "Tagging and pushing $SERVICE..."
  docker tag "$SERVICE" "$IMAGE_TAG"
  docker push "$IMAGE_TAG"
done

echo "✅ All images pushed successfully!"