#!/bin/bash
set -ev

IMAGE_NAME=kasramp/calibre-docker
TAGGED_VERSION=$(<version.txt)

docker login -u "$DOCKER_USERNAME" --password-stdin <<< "$DOCKER_PASSWORD" &&
docker buildx create --use &&
docker buildx build --pull --platform linux/amd64,linux/arm64 --build-arg VERSION="$TAGGED_VERSION" -t "$IMAGE_NAME":latest -t "$IMAGE_NAME:$TAGGED_VERSION" . --push
echo "Successfully build and pushed Docker $TAGGED_VERSION to Docker Hub"
