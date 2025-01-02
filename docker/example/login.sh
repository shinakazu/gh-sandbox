#!/bin/sh

cd "$(dirname "$0")"
. ./var.conf

CONTAINER_STATUS=`docker inspect --format '{{.State.Status}}' ${CONTAINER_NAME} 2>/dev/null`

if ! [ "${CONTAINER_STATUS}" == "running" ]; then
    echo "${CONTAINER_NAME} is not running or does not exist."
    exit 1
fi

echo "=== Login to the container : ${CONTAINER_NAME} ==="
docker exec -it ${CONTAINER_NAME} /bin/ash
