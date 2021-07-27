#!/bin/sh

DOCKER_GID=1724
DOCKER_UID=1724
GROUP=theia
USER=theia
APP_HOME=/home/theia

# Install extra package
microdnf install -y  sudo git wget curl ca-certificates zip vim make bash tar gzip &&\
microdnf clean all && \
rm -rf /tmp/* /var/tmp/*

# Create user and group
groupadd --gid ${DOCKER_GID} ${GROUP} && \
useradd -c "User for che" -d ${APP_HOME} -m -g ${GROUP} -s /bin/bash -u ${DOCKER_UID} ${USER} &&\
echo "%${GROUP} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${GROUP}

