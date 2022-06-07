#!/bin/bash
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 projectname imagename"
    exit 
fi

project=$1
image_name=$2
res_path="output/${project}"

# Create output path and ensure permissions are (more than) sufficient
rm -rf ${res_path}
mkdir -p -m 777 $res_path

# Build and run container with mounted output directory
docker build --build-arg project=$project -t meta .
docker run -it -v "$(pwd)"/${res_path}:/home/meta/output meta

# Build and save Docker image
cd $res_path
docker build -t ${image_name} .
docker save ${image_name} > ${image_name}.tar
