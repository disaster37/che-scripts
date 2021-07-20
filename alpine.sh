#!/bin/sh

GID=1724
UID=1724
GROUP=theia
USER=theia
APP_HOME=/home/theia

# Install extra package
apk --update add sudo git wget curl ca-certificates iputils zip vim make bash coreutils &&\
rm -rf /var/cache/apk/*

# Create user and group
addgroup -g ${GID} ${GROUP} && \
adduser -g "${USER} user" -D -h ${APP_HOME} -G ${GROUP} -s /bin/bash -u ${UID} ${USER} &&\
echo "%${GROUP} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${GROUP}
