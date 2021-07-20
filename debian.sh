#!/bin/sh

GID=1724
UID=1724
GROUP=theia
USER=theia
APP_HOME=/home/theia

# Install extra package
apt-get update &&\
apt-get install -y --no-install-recommends sudo git wget curl ca-certificates iputils-ping zip vim make bash aptitude &&\
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create user and group
addgroup --gid ${GID} ${GROUP} && \
useradd -c "User for che" -d ${APP_HOME} -m -g ${GROUP} -s /bin/bash -u ${UID} ${USER} &&\
echo "%${GROUP} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${GROUP}
