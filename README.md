# Docker Meta-Container
This repository provides a setup for creating a Docker meta-container that is able to generate Dockerfiles given project-specific Artefacts. The Dockerfiles are built using Ubuntu 20.04

## Adding a Project
Projects need to be added as a subdirectory in [project](project/). Two files can be provided in the subdirectory: 
* `packages` provides a list of packages that should be installed in the container.
* `Dockerfile-append` contains Dockerfile instructions that are appended to the generic Dockerfile.

The actual project files need to be added in `project/{project_name}/files`  

## Building a Container
To build a container, [build.sh](build.sh) needs to be executed. The script takes two parameters: first, the project name (i.e. the name of the folder in [project](project/)  and second, the image name.

For instance, to build the sample project "sorting", run:
`./build.sh sorting meta_sorting`
