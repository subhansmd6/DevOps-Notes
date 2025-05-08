
# Docker Notes

**Date:** 08-05-2025  
**Topic:** Docker

## What is Docker?

Docker is a containerization platform. We can build, ship, and run applications in containers using Docker.

## What is a Container?

A container contains:
- Application code
- Dependencies (software, configuration, environment variables, etc.)

To understand Docker, we need to understand the different types of deployment processes.

---

## Agenda

1. Introduction  
2. Virtualization and Containerization  
3. Virtual Machine vs Docker  
4. Installation  
5. Dockerfile, Docker Image, and Docker Container  
6. Docker Commands  
7. Build the Dockerfile  
8. Create Docker custom images and containers, push to DockerHub  
9. Docker Compose  
10. Docker Swarm

Additional Topics:
- Docker Networks  
- Docker Volumes  
- Docker Keywords  

---

## Containerization Software

Examples:
- Docker
- Podman
- Container-D
- CRIO
- Rocket (rkt)

We can create containers using containerization software.  
One of the most popular containerization tools is Docker.

---

## Virtual Machine vs Containers

| Virtual Machine | Containers |
|------------------|------------|
| Heavyweight | Lightweight |
| Limited performance | Native performance |
| Each VM runs its own OS | All containers share host OS |
| Hardware-level virtualization | No virtualization |
| Startup time in minutes | Startup time in milliseconds |
| Allocates required memory | Requires less memory space |
| Fully isolated (more secure) | Process-level isolation (possibly less secure) |

Additional Notes:
- Containers are portable.
- We can move containers from one server to another.

---

## Traditional Deployment vs Virtualization vs Containerization

### Traditional Deployment

- App  
- Software & Libraries  
- Operating System (interface between software and hardware)  
- Hardware  

### Virtualization Deployment

- App1, App2  
- Software & Libraries  
- OS  
- Virtual Machine  
- Hypervisor  
- Operating System  
- Hardware  

### Container Deployment (Docker)

- App1, App2, App3  
- Software Libraries  
- Containerization (Docker)  
- Operating System  
- Hardware  

> **Note:** Container deployment does not require guest OS.
