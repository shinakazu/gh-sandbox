#!/bin/sh

cd "$(dirname "$0")"
. ./var.conf

echo "=== Remove the container if it exists ==="

if docker inspect ${CONTAINER_NAME} &> /dev/null; then
    echo "Remove the following container :"
    docker rm -f ${CONTAINER_NAME}
else
    echo "${CONTAINER_NAME} does not exist."
fi
