#!/bin/bash

# Remove previous Docker installations
apt-get purge -y docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin containerd.io
apt-get autoremove -y --purge docker-engine docker docker.io docker-ce docker-ce-cli docker-compose-plugin containerd.io

# Install fresh Docker
cd /opt
USER=client
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
usermod -aG docker $USER
systemctl enable docker
systemctl enable containerd
systemctl start docker
chmod 666 /var/run/docker.sock
docker --version
docker compose version
docker run hello-world
