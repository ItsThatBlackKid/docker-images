#!/bin/bash
if [ -z "$1" ] 
then
    echo "Usage: $0 <image-name>"
    exit i
fi

IMAGE_NAME=$1

docker build --no-cache --tag "$1" .