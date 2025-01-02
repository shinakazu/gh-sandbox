#!/bin/sh

cd "$(dirname "$0")"
. ./var.conf

echo "=== Remove docker image in advance : ${IMAGE_REPOSITORY}:${IMAGE_TAG} ==="
if docker inspect ${IMAGE_REPOSITORY}:${IMAGE_TAG} &> /dev/null; then
    echo "Remove the following docker image :"
    docker image rm -f ${IMAGE_REPOSITORY}:${IMAGE_TAG}
else
    echo "${IMAGE_REPOSITORY}:${IMAGE_TAG} does not exist."
fi

echo "=== Build docker image : ${IMAGE_REPOSITORY}:${IMAGE_TAG} ==="
echo ${LABEL}
docker build -f ./Dockerfile -t ${IMAGE_REPOSITORY}:${IMAGE_TAG} --label ${LABEL} .