# Template Dockerfile that contains generic steps of building a container for reproduction packages

# Copyright 2021, Wolfgang Mauerer <wolfgang.mauerer@othr.de>
# Copyright 2021, Stefanie Scherzinger <stefanie.scherzinger@uni-passau.de>
# Copyright 2021, Stefan Klessinger <stefan.klessinger@uni-passau.de>
# SPDX-License-Identifier: MIT-0

# Start off of a long-term maintained base distribution
FROM ubuntu:20.04

MAINTAINER Stefan Klessinger <stefan.klessinger@uni-passau.de>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"

# Install packages
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
		gettext \
		r-base \
		texlive-base 

# Add user
RUN useradd -m -G sudo -s /bin/bash meta && echo "meta:meta" | chpasswd
USER meta
WORKDIR /home/meta

COPY --chown=meta generic/build.sh /home/meta/build.sh
RUN chmod +x build.sh
RUN ls
COPY --chown=meta generic/Dockerfile_generic /home/meta/Dockerfile_generic
ARG project
COPY --chown=meta project/${project} /home/meta/project/
RUN mkdir -p -m 777 output

ENTRYPOINT /home/meta/build.sh
