<h1 align="center">Inception</h1>

# Table of Contents
1. [Subject Requirements](#subject-requirements)
2. [Docker](#docker)
   - [Definition](#docker-definition)
   - [Docker Architecture](#docker-architecture)
   - [Docker CMD](#docker-cmd)
   - [How Docker Works?](#how-docker-works)
   - [Docker Isolation](#docker-isolation)
   - [Does Docker Containers Share the Host OS Kernel?](#docker-container-sharing-kernel)
3. [MariaDB](#mariadb)
   - [Definition](#mariadb-definition)
   - [What is a Database?](#what-is-a-database)
   - [History of MariaDB](#history-of-mariadb)
   - [MariaDB CMD](#mariadb-cmd)
   - [MariaDB Configuration](#mariadb-configuration)
4. [WordPress](#wordpress)
   - [Definition](#wordpress-definition)
   - [WordPress Configuration](#wordpress-configuration)
5. [Nginx](#nginx)
   - [Definition](#nginx-definition)
   - [HTTPS](#https)
   - [SSL](#ssl)
   - [Nginx Configuration](#nginx-configuration)
6. [Resources](#resources)

---

## I. Subject Requirements
   - This project consists in having you set up a small infrastructure composed of different
services under specific rules. The whole project has to be done in a virtual machine. You
have to use docker compose.
<p align="center">  <img src="Assets/Infrastructure.png" </p>
   
  <p style="text-align: center;">
  <a href="https://cdn.intra.42.fr/pdf/pdf/103030/en.subject.pdf" target="_blank">Inception Subject Link</a>
</p>

## II. Docker

### Definition
- `Docker` is a tool that can package an application and its dependencies into an isolated container.
- `Docker Container` is an isolated workspace.
- `Docker image` is a blueprint or a template for creating Docker containers. It provides all the necessary instructions and dependencies required to create and run a containerized application.
- `Docker compose` is a tool that allows you to define and manage multi-container Docker applications. It provides a convenient way to describe the services, networks, and volumes required for your application in a declarative YAML file.
- `Docker volume` is a persistent data storage mechanism that allows containers to share and store data outside of their individual file systems. Volumes are used to persist and share data between containers, as well as between containers and the host machine.
- `Docker network` is a virtual infrastructure that enables communication between containers and between containers and the host machine. Docker networks provide isolation, security, and flexibility for containerized applications.
### Docker Architecture
- `Docker` uses a client-server architecture. The `Docker client` talks to the `Docker daemon`, which does the heavy lifting of building, running, and distributing your `Docker containers`. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface. Another Docker client is Docker Compose, that lets you work with applications consisting of a set of containers.

  <p align="center">  <img src="Assets/docker-architecture.webp" </p>
  
#### The Docker daemon
- The Docker daemon `dockerd` listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

#### The Docker client
- The Docker client `docker` is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

### Docker CMD

| Command | Description |
| :----------- | :----------- |
| docker build . -t `(image)` | This command tells Docker to build an image based on the Dockerfile in the current directory and tag it with the name `(image)` |
| docker images | list docker images. |
| docker run --name `(ctr)` `(image)`  | start a new Docker container `(ctr)` from an image `(image)` |
| docker run -d --name ctr image | start a new Docker container `(ctr)` from an image `(image)` in the background |
| docker run -p `443:443` --name ctr image | The -p option specifies the port mapping. It tells Docker to map port 443 from the container to port 443 on the host machine. The format is <host_port>:<container_port> |
| docker run -v `VolumeName`:`/path/in/container` ... | This command mounts the volume `VolumeName` inside the container at the specified `/path/in/container` location |
| docker ps | This command is used to list all the running Docker containers. |
| docker stop `(ctr)` | This command is used to stop a running container |
| docker rm -f `(ctr)` | This command is used to remove a Docker container |
| docker rmi -f `(ctr)` | This command is used to remove a Docker image |
| docker kill | Kill one or more running containers |
| docker exec -it `(ctr)` bash| start an interactive bash session inside the specified container `(ctr)`

**NOTE :** 
There are more commands to use with docker but in this table I specified the top essential Docker commands that you might need in the process of creating your own containers.

### How Docker Works?
- Docker is written in the [Go programming language](https://golang.org/) and takes advantage of several features of the Linux kernel to deliver its functionality. Docker uses a technology called `namespaces` to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.
- The process of building Docker images and running containers in relation to Docker, containerd, and runc.

<p align="center">  <img src="Assets/conatainerd.png" </p>

   **Building Docker Images:**

1. When you issue a `docker build` command with a Dockerfile, it is the Docker daemon (`dockerd`) that handles the build process.
2. The Docker daemon reads the Dockerfile instructions and orchestrates the build process. It pulls necessary base images, executes each instruction, and creates the desired image following the defined steps.
3. During the build process, the Docker daemon interacts with containerd to manage the image layers, intermediate containers, and storage operations.

   **Running Containers:**

1. When you run a Docker container using the `docker run` command, it is the Docker daemon (`dockerd`) that handles the container creation and execution.
2. The Docker daemon communicates with containerd and instructs it to create a container based on the specified image.
3. Containerd, as the container runtime, then utilizes runc to create and manage the container process with the appropriate namespaces, cgroups, and other isolation mechanisms.


### Docker Isolation

### Does Docker Containers Share the Host OS Kernel?

## III. MariaDB

### Definition

### What is a Database?

### History of MariaDB

### MariaDB CMD

### MariaDB Configuration

## IV. WordPress

### Definition

WordPress is a popular open-source content management system (CMS)...

### WordPress Configuration

## V. Nginx

### Definition

### HTTPS

### SSL

### Nginx Configuration

## VI. Resources
