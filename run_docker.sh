#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
# or docker build -t mls .
docker build --tag=mls .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run spring boot app (Maven)
docker run -p 8080:8080 mls
