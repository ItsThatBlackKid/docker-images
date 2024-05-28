#!/bin/bash

# Check if the dataset directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/your/dataset"
  exit 1
fi

# Get the dataset directory from the argument
DATASET_DIR=$1

# Ensure the dataset directory exists
if [ ! -d "$DATASET_DIR" ]; then
  echo "Error: Directory $DATASET_DIR does not exist."
  exit 1
fi

# Define the Docker image name
IMAGE_NAME="python-ml"

# Run the Docker container with the dataset directory mounted
docker run -p 8888:8888 -p 6006:6006 -v "$DATASET_DIR":/home/jupyteruser/dataset $IMAGE_NAME