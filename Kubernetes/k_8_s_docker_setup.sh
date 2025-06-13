#!/bin/bash

set -e
LOGFILE="install.log"
exec > >(tee -i $LOGFILE)
exec 2>&1

echo "=== [1/8] Updating system packages ==="
sudo apt-get update -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https

# Docker Installation
if ! command -v docker &>/dev/null; then
  echo "=== [2/8] Installing Docker ==="
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update -y
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || {
    echo "Docker installation failed." >&2
    exit 1
  }

  echo "=== [3/8] Adding user to docker group ==="
  sudo usermod -aG docker $USER
  newgrp docker <<EONG
  echo "✅ Docker group switched."
EONG

  sudo systemctl enable docker
  sudo systemctl start docker
  echo "✅ Docker installed and running."
else
  echo "✅ Docker already installed. Skipping."
fi

# kubectl installation
if ! command -v kubectl &>/dev/null; then
  echo "=== [4/8] Installing kubectl ==="
  curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/
  echo "✅ kubectl installed."
else
  echo "✅ kubectl already installed. Skipping."
fi

# Minikube installation
if ! command -v minikube &>/dev/null; then
  echo "=== [5/8] Installing Minikube ==="
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
  echo "✅ Minikube installed."
else
  echo "✅ Minikube already installed. Skipping."
fi

# Start Minikube
echo "=== [6/8] Starting Minikube with Docker driver ==="
minikube start --driver=docker || {
  echo "❌ Minikube failed to start." >&2
  exit 1
}

echo "=== [7/8] Checking Kubernetes installation ==="
kubectl version --client && minikube status

echo "=== [8/8] Setup Complete ==="
echo "🎉 All done! If you just added your user to the docker group, log out and back in or run 'newgrp docker' to apply permissions."
