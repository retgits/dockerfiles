#!/usr/bin/env bash

# Description: Update JFrog CLI images
# Author: retgits <https://github.com/retgits>
# Last Updated: 2019-04-21

# Set the current and new version
CURR=1.26.0
NEW=$1

# Loop over the images and build new ones
for d in */ ; do
    cd $d
    sed -i "s/$CURR/$1/g" Dockerfile
    a=`cat Dockerfile | sed -n '2 p'`
    b=${a:2}
    $b
    cd ..
done

# Push new containers to DockerHub
docker push retgits/jfrog-cli:$NEW
docker push retgits/jfrog-cli:$NEW-alpine

# Replace CURR with NEW in this file
sed -i "s/CURR=$CURR/CURR=$NEW/g" update.sh