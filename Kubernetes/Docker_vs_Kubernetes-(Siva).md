
# Docker vs Kubernetes

## 1) Containerization
- Running our application inside a container  
  **Example:** Docker Containers  
- Packaging our app code and dependencies as a single unit for execution is called *Containerization*.

## 2) Orchestration
- Managing Containers  
  **Examples:** Docker Compose, Docker Swarm, Kubernetes, OpenShift

---

# Kubernetes (K8s)

- It is an open-source software
- K8s is called an **Orchestration Tool**
- Used to manage containers (create, stop, start, remove, scale-up/down)
- Developed by **Google**
- Written in **Go language**
- Kubernetes is also called **K8s**

---

## Advantages of K8s

1. **Auto Scaling** – Based on demand, container count increases or decreases  
2. **Self Healing** – Load is distributed to healthy containers  
3. **Load Balancing** – Crashed containers are replaced automatically  

---

## Docker vs Kubernetes

| Docker | Kubernetes |
|--------|------------|
| Containerization platform | Orchestration platform |
| Packages app and dependencies into containers | Manages and deploys containers |

---

# Kubernetes Architecture

- K8s follows **cluster architecture**
- A **cluster** is a group of servers
- Cluster has:
  - **Master Node** (Control Plane)
  - **Worker Nodes**

### Master Node (Control Plane)
- Receives and assigns tasks to Worker Nodes
- Acts like a manager

### Worker Nodes
- Executes tasks given by Master Node
- Acts like employees

- One Control Plane can have **multiple Worker Nodes**
- Tasks are given using **kubectl (CLI)** or a UI

---

# K8s Cluster Components

## 1) Control Plane (Master Node)
- **API Server** – Receives requests from `kubectl`
- **Scheduler** – Finds pending tasks in etcd and assigns to a suitable worker node
- **Controller Manager** – Ensures tasks are running correctly
- **ETCD** – Internal key-value store/database of the cluster

## 2) Worker Node
- **Kubelet** – Node agent, keeps node info, communicates with Scheduler
- **Kube Proxy** – Provides networking for cluster communication
- **Docker Engine** – Runs the containers
- **Pod** – Smallest unit in K8s; holds one or more containers

### Note:
- In Kubernetes, **containers are created inside Pods**
- Everything in K8s is represented as a **Pod**

---

## Summary

- **Kubectl** is used to communicate with the K8s cluster
- **API Server** receives request → stored in **etcd**
- **Scheduler** scans etcd → uses **Kubelet** to find appropriate worker
- **Kube Proxy** manages networking
- **Controller Manager** verifies task status
- **Docker Engine** on Worker Node runs the containers inside **Pods**
- One Pod can hold **multiple containers**
