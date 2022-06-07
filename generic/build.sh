#!/bin/bash

# Read in project-specific packages and additions to Dockerfile
export META_PACKAGES="$(< project/packages)"
export META_APPEND="$(< project/Dockerfile-append)"

# Add project-specific packages and additions to Dockerfile
envsubst < "Dockerfile_generic" > "Dockerfile"

# Move project-specific artefacts and generated Dockefile to output
cp Dockerfile output
mkdir -p -m 777 output/artefacts
cp -r project/files/* output/artefacts
