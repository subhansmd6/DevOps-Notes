```
apiVersion: apps/v1 API version for Deployment resource
kind: Deployment Resource type (Deployment in this case)

metad: Metadata section for resource information
name: nginx-deployment ————__________________+ unique name for the Deployment
namespace: production Namespace where Deployment will be created
labels To organize and select Deployments
pi nginx App label, useful for selectors
ion: v1.0 Version label for tracking releases

Desired state specification
Number of pod replicas to maintain
How to select pods managed by this Deployment
hLabels: Label selector configuration
app: nginx Pods must have this label to be managed
plate: Pod template for creating replicas
adata: Metadata for pods created by this Deployment
label > Labels applied to created pods
app: nginx App label for (matches selector)
pec Container specification

containe:

ee List of containers in each pod
nginx > Container name
image: ng} 21 —____________________ + Docker image and version
ports: » Ports exposed by the container
» Port the container listens on
» Environment variables for configuration
name: ENV_VAR ————____________________ . Environment variable name
value: production ———_________ + Environment variable value
Resource limits and requests
Limits: Maximum resources allowed
memory: "512Mi" ———————_______________ .. Memory Limit
> CPU Limit
Minimum resources requested
jemoxry: "256"i" ——_________________ + Memory request
"25m" —————_____________ » cpu request
venessProbe: + Health check to restart unhealthy containers
httpGet » HTTP health check
health —————__________________ +. Health check endpoint
80 » Port for health check
alDelaySecond: ————_______— » wait before first check
Seconds: 1@ ———__________________ ». check interval
» Health check for traffic routing
+ HTTP readiness check
> Readiness endpoint
+ Port for readiness check
» Wait before first check
» Check interval
olumeMounts > Volumes mounted inside the container
name: config-volume ——__________________ » volume defined in "volumes" section
ountPath: /ete/nginx/conf.d ———_______ » Mount. point inside container
nly: + mount as read-only
hame: data-volume ————__________________ > Persistent data volume
mountPath: Jw /btm) ———__—_ > Mount point for web content
hame: secret-volume ———______________ + Secret mounted as volum
mountPath: /etc/sst/certs ——___________ » Mount point for certificates
true ———_______________ > mount as read-only
+ Volumes available to all containers
config-volume ———_________________ > Name of the volume
configMap » Use Configmap as volume source
name: nginx-config ——_______________ + Reference Confighap named "nginx-config"
name: secret-volume ————_________________ . Secret volume
> Use Secret olume source
Name: nginx-secret _______________ + Reference Secret named "nginx-secret"
data-volume ——___________________ -. Persistent storage volume
persistentVolumeClaim: ———_______________ » Use PVC as volume so
claimName: nginx-pye ——_________________ Reference Pvc named "nginx-pvc"
empty-dir-volume ———_______________ > Temporary volume
empt! Empty directory volume
izeLimit: 146i ——_________________ + Size Limit for temporary storage

Sagar Utekar
```