
# 🌐 What is Kubernetes?

## ✅ Simple Definition:
Kubernetes (also called K8s) is an open-source platform that helps you automate the deployment, scaling, and management of containerized applications.

## 🚢 Why Do We Need Kubernetes?
Let’s say you have an app in a Docker container — great! But what happens when:

- You need to run 100 copies of that app?
- A server crashes, and containers die?
- You want to update the app without downtime?
- You want to expose your app to the internet?

Kubernetes handles all of this automatically.

## 🧱 Kubernetes Core Concepts

### 1. Pod
- The smallest unit in Kubernetes.
- Runs one or more containers (usually one).
- Think of it as a wrapper around your Docker container.

### 2. Node
- A worker machine (VM or physical), where pods run.
- Each node runs container runtime (like Docker) and a Kubelet.

### 3. Cluster
- A group of nodes working together, managed by the Kubernetes control plane.

### 4. Deployment
- Defines how many replicas of your app to run.
- Ensures the correct number of pods are running at all times.

### 5. Service
- Exposes your app so it can be accessed:
  - Internally (ClusterIP)
  - Externally (NodePort, LoadBalancer)

## ⚙️ Kubernetes Architecture (Simple View)

```
              +-------------------+
              |  Master Node      |  (Control Plane)
              |-------------------|
              |  API Server       |
              |  Scheduler        |
              |  Controller Mgr   |
              |  etcd (Database)  |
              +--------|----------+
                       |
         ----------------------------------
         |                |               |
+----------------+ +----------------+ +----------------+
|   Worker Node 1 | |   Worker Node 2 | |   Worker Node 3 |
|----------------| |----------------| |----------------|
| kubelet        | | kubelet        | | kubelet        |
| container run. | | container run. | | container run. |
| Pods           | | Pods           | | Pods           |
+----------------+ +----------------+ +----------------+
```

## 🧠 Real-World Example

You're running a food delivery app:
- Each part (restaurant, delivery, payment) runs in a container.
- Kubernetes runs these containers as pods, restarts them if they crash, and scales them based on traffic.

## ✅ Key Benefits of Kubernetes
- Self-healing: Restarts crashed containers
- Scaling: Add/remove instances automatically
- Rolling updates: No downtime while updating
- Service discovery & Load balancing
- Resource management (CPU/RAM)

---

# 🚀 Installing Minikube

## ✅ Bash Script: Install Docker, kubectl, and Minikube

```bash
#!/bin/bash

set -e

echo "📦 Updating system..."
sudo apt update -y
sudo apt upgrade -y

echo "🐳 Installing Docker..."
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

echo "✅ Docker installed."

echo "🔧 Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo "✅ kubectl installed."

echo "🚀 Installing Minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

echo "✅ Minikube installed."

echo "🚦 Starting Minikube with Docker driver..."
minikube start --driver=docker

echo "🎉 All done!"
echo "🔁 Please log out and log back in (or run 'newgrp docker') to use Docker without sudo."
```

## ▶️ To Use:
```bash
nano install_k8s.sh
chmod +x install_k8s.sh
./install_k8s.sh
newgrp docker
```

## ✅ After Installation Check:
```bash
docker --version
kubectl version --client
minikube version
kubectl get nodes
```

---

# ✅ Create and Deploy Your First Pod

## 🎯 Objective:
Run an NGINX web server in a Kubernetes pod.

### 📄 Step 1: YAML for Pod
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    app: nginx
spec:
  containers:
    - name: nginx
      image: nginx:latest
      ports:
        - containerPort: 80
```

### 🚀 Step 2: Apply the Pod
```bash
kubectl apply -f nginx-pod.yaml
kubectl get pods
```

### 🌐 Step 3: Access Pod (Optional)
```bash
kubectl exec -it nginx-pod -- /bin/bash
curl localhost:80
kubectl logs nginx-pod
```

---

# 🚀 Kubernetes Deployment + NodePort Service

### 📄 nginx-deployment.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:latest
          ports:
            - containerPort: 80
```

### 📄 nginx-service.yaml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30080
```

### ⚙️ Apply & Verify
```bash
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
kubectl get deployments
kubectl get pods
kubectl get svc
```

### 🌐 Access in Browser
```bash
minikube service nginx-service --url
```

---

# 🔧 Core Kubernetes Features

## ✅ 1. ConfigMap
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  APP_COLOR: "blue"
  APP_MODE: "production"
```

### Use in Pod:
```yaml
env:
  - name: APP_COLOR
    valueFrom:
      configMapKeyRef:
        name: my-config
        key: APP_COLOR
```

## ✅ 2. Secrets
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  password: bXlwYXNzd29yZA==
```

### Use in Pod:
```yaml
env:
  - name: PASSWORD
    valueFrom:
      secretKeyRef:
        name: my-secret
        key: password
```

## ✅ 3. Resource Limits
```yaml
resources:
  requests:
    memory: "64Mi"
    cpu: "250m"
  limits:
    memory: "128Mi"
    cpu: "500m"
```

## ✅ 4. Rolling Updates
```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.25
kubectl rollout status deployment/nginx-deployment
kubectl rollout undo deployment/nginx-deployment
```

## ✅ 5. Ingress
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
spec:
  rules:
  - host: myapp.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80
```

```bash
minikube addons enable ingress
curl http://myapp.local
```
