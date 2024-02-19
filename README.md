<h1 align="center">Inception</h1>

# Table of Contents
1. [Subject Requirements](#subject-requirements)
2. [Docker](#docker)
   - [Definition](#docker-definition)
   - [Docker Architecture](#docker-architecture)
   - [Docker CMD](#docker-cmd)
   - [How Docker Works?](#how-docker-works)
   - [Does Docker Containers Share the Host OS Kernel?](#docker-container-sharing-kernel)
   - [Docker Isolation](#docker-isolation)
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
The Docker daemon `dockerd` listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

#### The Docker client
The Docker client `docker` is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.




### Docker CMD

### How Docker Works?

### Does Docker Containers Share the Host OS Kernel?

### Docker Isolation

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
