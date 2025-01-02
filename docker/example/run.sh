#!/bin/sh

cd "$(dirname "$0")"
. ./var.conf

# Check if the container exists in advance
./remove.sh

echo "=== Create and run the container : ${CONTAINER_NAME} ==="
docker run -itd --name ${CONTAINER_NAME} -h ${CONTAINER_NAME} ${IMAGE_REPOSITORY}:${IMAGE_TAG}

