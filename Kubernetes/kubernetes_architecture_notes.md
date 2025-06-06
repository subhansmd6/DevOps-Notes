# Kubernetes Architecture – Step-by-Step Notes

## 🚀 What is Kubernetes?

- Kubernetes (K8s) is an open-source platform to **automate deployment, scaling, and management** of containerized applications.
- Think of it as an **orchestrator** for containers – decides when, where, and how containers run.

---

## 🔹 Step 1: Core Concept — Cluster

- A **Kubernetes cluster** is a group of machines (nodes):
  - **1 Master Node** (Control Plane)
  - **Multiple Worker Nodes**

🧠 Analogy:
- **Master = Boss**
- **Workers = Employees** running your applications

---

## 🔹 Step 2: Master Node Components (Control Plane)

1. **API Server**
   - Entry point for all commands (via `kubectl`, UI, etc.)
   - Acts as a **gatekeeper**

2. **Scheduler**
   - Decides **which pod runs on which node**

3. **Controller Manager**
   - Runs background processes like:
     - Replacing failed pods
     - Maintaining replicas

4. **etcd (Key-Value Store)**
   - Stores **entire cluster state**
   - Used for recovery and persistence

---

## 🔹 Step 3: Worker Node Components

Each Worker Node runs:

1. **kubelet**
   - Talks to the master
   - Ensures pods/containers are running

2. **Container Runtime**
   - Software that runs containers (e.g., Docker, containerd)

3. **kube-proxy**
   - Handles **networking and load balancing** in the cluster

---

## 🔹 Step 4: Pods and Containers

- **Pod** is the smallest unit in Kubernetes
- Each Pod can have **one or more containers**
- Kubernetes schedules **pods**, not containers directly

---

## 🔹 Step 5: Kubernetes Resources

- **Deployment**: Manages pods and updates
- **Service**: Exposes pods within or outside the cluster
- **ConfigMap/Secrets**: Manage app configuration
- **Ingress**: Manages HTTP access to services
- **Namespace**: Logical grouping of resources

---

## 🔹 Step 6: How a Request Flows

1. You run `kubectl apply -f deployment.yaml`
2. **API Server** receives the request
3. **Scheduler** assigns a node
4. **kubelet** on that node gets pod spec
5. **Container runtime** starts the container
6. **Service** exposes it for access

---

## 📌 Visual Summary

```
USER (kubectl)
     ↓
[ API Server ]
     ↓
[ Scheduler ] —> picks node
     ↓
[ Controller Manager ] —> ensures desired state
     ↓
[ etcd ] —> stores config/state
     ↓
[ Worker Node ]
   ├─ kubelet
   ├─ kube-proxy
   └─ Container Runtime (Docker, etc.)
        └─ [ Pod ] → [ Container ]
```
