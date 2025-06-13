
# Kubernetes Deployment Manifest Explained

```yaml
apiVersion: apps/v1              # API version for Deployment resource
kind: Deployment                 # Resource type (Deployment in this case)

metadata:                        # Metadata section for resource information
  name: nginx-deployment         # Unique name for the Deployment
  namespace: production          # Namespace where Deployment will be created
  labels:                        # To organize and select Deployments
    app: nginx                   # App label, useful for selectors
    version: v1.0                # Version label for tracking releases

spec:                            # Desired state specification
  replicas: 3                    # Number of pod replicas to maintain
  selector:                      # How to select pods managed by this Deployment
    matchLabels:
      app: nginx                 # Pods must have this label to be managed
  template:                      # Pod template for creating replicas
    metadata:                    # Metadata for pods created by this Deployment
      labels:
        app: nginx               # App label for pods (matches selector)
    spec:                        # Container specification
      containers:                # List of containers in each pod
        - name: nginx            # Container name
          image: nginx:1.21      # Docker image and version
          ports:
            - containerPort: 80  # Port the container listens on
          env:                   # Environment variables for configuration
            - name: ENV_VAR      # Environment variable name
              value: production  # Environment variable value
          resources:             # Resource limits and requests
            limits:
              memory: "512Mi"    # Memory Limit
              cpu: "500m"        # CPU Limit
            requests:
              memory: "256Mi"    # Memory request
              cpu: "250m"        # CPU request
          livenessProbe:         # Health check to restart unhealthy containers
            httpGet:
              path: /health      # Health check endpoint
              port: 80           # Port for health check
            initialDelaySeconds: 30  # Wait before first check
            periodSeconds: 10    # Check interval
          readinessProbe:        # Health check for traffic routing
            httpGet:
              path: /ready       # Readiness endpoint
              port: 80           # Port for readiness check
            initialDelaySeconds: 5   # Wait before first check
            periodSeconds: 5     # Check interval
          volumeMounts:          # Volumes mounted inside the container
            - name: config-volume
              mountPath: /etc/nginx/conf.d  # Mount point inside container
              readOnly: true
            - name: data-volume
              mountPath: /var/www/html      # Mount point for web content
            - name: secret-volume
              mountPath: /etc/ssl/certs     # Mount point for certificates
              readOnly: true

      volumes:                   # Volumes available to all containers
        - name: config-volume
          configMap:
            name: nginx-config   # Reference ConfigMap named "nginx-config"
        - name: secret-volume
          secret:
            secretName: nginx-secret  # Reference Secret named "nginx-secret"
        - name: data-volume
          persistentVolumeClaim:
            claimName: nginx-pvc      # Reference PVC named "nginx-pvc"
        - name: empty-dir-volume
          emptyDir:
            sizeLimit: 1Gi       # Size Limit for temporary storage
```

*Author: Sagar Utekar*
