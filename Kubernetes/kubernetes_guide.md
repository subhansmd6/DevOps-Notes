# Kubernetes Full Guide with YAML Examples

---

## Phase 1: Kubernetes Basics

### What is Kubernetes?
[Kubernetes](w) is an open-source container orchestration platform developed by Google and now maintained by the CNCF. It automates deployment, scaling, and management of containerized applications.

### Why Do We Need It?
- Automates container deployment and scaling
- Handles load balancing and self-healing
- Manages configuration and secrets
- Provides service discovery

### Basic Terminologies:
- **Pod**: Smallest deployable unit, encapsulates one or more containers.
- **Node**: A worker machine (VM or physical) in the Kubernetes cluster.
- **Cluster**: A set of nodes managed by Kubernetes.
- **Deployment**: Manages stateless application replicas.
- **Service**: Exposes an application running in Pods to other Pods or external users.

### YAML Basics for Kubernetes
YAML (YAML Ain't Markup Language) is used to define Kubernetes objects.

Example Pod YAML:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
    - name: mycontainer
      image: nginx
```

---

## Phase 2: Setup and Hands-on

### How to Install Kubernetes (Minikube or Kind)
- **Minikube:**
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
```

- **Kind:**
```bash
GO111MODULE="on" go install sigs.k8s.io/kind@v0.20.0
kind create cluster
```

### kubectl: Kubernetes CLI Commands
```bash
kubectl get pods
kubectl get nodes
kubectl create -f pod.yaml
kubectl delete pod mypod
```

### Create Your First Pod and Service
```yaml
# pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
    - name: nginx
      image: nginx
```
```yaml
# service.yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: NodePort
```

---

## Phase 3: Core Concepts in Depth

### ReplicaSets and Deployments
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
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
          image: nginx
```

### Services: ClusterIP, NodePort, LoadBalancer, ExternalName
- **ClusterIP (default)**: Internal access
- **NodePort**: Exposes service on node IP
- **LoadBalancer**: Uses cloud load balancer
- **ExternalName**: Maps service to DNS name

```yaml
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  type: LoadBalancer
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
```

### ConfigMaps and Secrets
```yaml
# ConfigMap
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  key: value
```
```yaml
# Secret
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
type: Opaque
stringData:
  username: admin
  password: secret
```

### Namespaces, Labels, and Annotations
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev
```
Labels and Annotations:
```yaml
metadata:
  labels:
    env: dev
  annotations:
    owner: teamA
```

---

## Phase 4: Workloads and Management

### StatefulSets and DaemonSets
```yaml
# StatefulSet
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: web
spec:
  serviceName: "nginx"
  replicas: 3
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
          image: nginx
```
```yaml
# DaemonSet
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: log-agent
spec:
  selector:
    matchLabels:
      app: log-agent
  template:
    metadata:
      labels:
        app: log-agent
    spec:
      containers:
        - name: log-agent
          image: log-agent-image
```

### Volumes and PersistentVolumes
```yaml
# PersistentVolumeClaim
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

### Resource Limits and Requests
```yaml
resources:
  requests:
    memory: "64Mi"
    cpu: "250m"
  limits:
    memory: "128Mi"
    cpu: "500m"
```

### Health Checks: Liveness and Readiness Probes
```yaml
livenessProbe:
  httpGet:
    path: /healthz
    port: 8080
  initialDelaySeconds: 3
  periodSeconds: 3
```
```yaml
readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 3
  periodSeconds: 3
```

---

## Phase 5: Advanced Topics

### Ingress Controllers
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
spec:
  rules:
    - host: myapp.local
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: my-service
                port:
                  number: 80
```

### Helm Charts
Helm is a package manager for Kubernetes.
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-nginx bitnami/nginx
```

### RBAC (Role-Based Access Control)
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```
```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

### Monitoring with Prometheus & Grafana
- Deploy Prometheus and Grafana using Helm:
```bash
helm install prometheus prometheus-community/prometheus
helm install grafana grafana/grafana
```

---

## Conclusion
This guide provides a structured learning path to master Kubernetes from basics to advanced topics. You can use `kubectl` to interact with your cluster and YAML files to define and deploy all Kubernetes resources.
