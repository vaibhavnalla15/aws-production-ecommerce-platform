#!/bin/bash
set -e

############################################################
# Update System
############################################################

dnf update -y

############################################################
# Install Docker
############################################################

dnf install -y docker

systemctl enable docker
systemctl start docker

############################################################
# Remove Existing Container
############################################################

docker rm -f cloudcart || true

############################################################
# Pull CloudCart Image
############################################################

docker pull ${docker_image}:${docker_image_tag}

############################################################
# Run CloudCart Container
############################################################

docker run -d \
  --pull=always \
  --name cloudcart \
  --restart unless-stopped \
  -p 80:${application_port} \
  ${docker_image}:${docker_image_tag}