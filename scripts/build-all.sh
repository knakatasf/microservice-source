#!/bin/sh
set -e  # Exit immediately if a command exits with a non-zero status

echo "Building frontend-service..."
cd frontend-service
docker build --no-cache --platform linux/amd64 -t frontend-service .
cd ..

echo "Building catalog-service..."
cd catalog-service
docker build --no-cache --platform linux/amd64 -t catalog-service .
cd ..

echo "Building customer-service..."
cd customer-service
docker build --no-cache --platform linux/amd64 -t customer-service .
cd ..

echo "Building order-service..."
cd order-service
docker build --no-cache --platform linux/amd64 -t order-service .
cd ..



echo "✅ All images built successfully!"