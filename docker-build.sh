#!/bin/sh
set -e  # Exit immediately if a command exits with a non-zero status

echo "Building frontend-service..."
cd frontend-service
docker build --no-cache -t frontend-service .
cd ..

echo "Building catalog-service..."
cd catalog-service
docker build --no-cache -t catalog-service .
cd ..

echo "Building customer-service..."
cd customer-service
docker build --no-cache -t customer-service .
cd ..

echo "Building order-service..."
cd order-service
docker build --no-cache -t order-service .
cd ..

echo "✅ All images built successfully!"