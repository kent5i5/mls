#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath="yinkin/mls"

# Step 2:  
# Authenticate & tag
docker login -p --username=yinkin --email=califorykng5i5@gmail.com
docker tag 4044257fc521 $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath