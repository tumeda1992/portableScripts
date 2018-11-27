#! /bin/bash

prj_name=$1

echo "remove existing image"
docker stop ${prj_name}
docker rm ${prj_name}
docker rmi ${prj_name}
