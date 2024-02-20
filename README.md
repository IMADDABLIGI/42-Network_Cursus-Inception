<h1 align="center">Inception</h1>

# Table of Contents
1. [Subject Requirements](#subject-requirements)
2. [Docker](#docker)
   - [I. Definition](#docker-definition)
   - [II. Docker Architecture](#docker-architecture)
   - [III. Docker CMD](#docker-cmd)
   - [IV. How Docker Works ?](#how-docker-works)
   - [V. Docker Isolation](#docker-isolation)
   - [VI. Does Docker Containers Share the Host OS Kernel?](#docker-container-sharing-kernel)
3. [MariaDB](#mariadb)
   - [I. Definition](#mariadb-definition)
   - [II. History of MariaDB](#history-of-mariadb)
   - [III. MariaDB CMD](#mariadb-cmd)
   - [IV. MariaDB Configuration](#mariadb-configuration)
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

## I. Subject Requirements <a name="subject-requirements"></a>
   - This project consists in having you set up a small infrastructure composed of different
services under specific rules. The whole project has to be done in a virtual machine. You
have to use docker compose.
<p align="center">  <img src="Assets/Infrastructure.png" </p>
   
  <p style="text-align: center;">
  <a href="https://cdn.intra.42.fr/pdf/pdf/103030/en.subject.pdf" target="_blank">Inception Subject Link</a>
</p>

## II. Docker <a name="docker"></a>

### I. Definition <a name="docker-definition"></a>
- `Docker` is a tool that can package an application and its dependencies into an isolated container.
- `Docker Container` is an isolated workspace.
- `Docker image` is a blueprint or a template for creating Docker containers. It provides all the necessary instructions and dependencies required to create and run a containerized application.
- `Docker compose` is a tool that allows you to define and manage multi-container Docker applications. It provides a convenient way to describe the services, networks, and volumes required for your application in a declarative YAML file.
- `Docker volume` is a persistent data storage mechanism that allows containers to share and store data outside of their individual file systems. Volumes are used to persist and share data between containers, as well as between containers and the host machine.
- `Docker network` is a virtual infrastructure that enables communication between containers and the host machine. Docker networks provide isolation, security, and flexibility for containerized applications.
- `Dockerd` shortcut of Docker Daemon which is the core component of the Docker platform. It is responsible for building, running, and managing Docker containers. When you install Docker on your system, it includes the Docker Engine along with other tools and services.
- `Containerd` shortcut of Container Daemon which manages the complete container lifecycle of its host system, from image transfer and storage to container execution and supervision to low-level storage to network attachments and beyond.
### II. Docker Architecture <a name="docker-architecture"></a>
- `Docker` uses a client-server architecture. The `Docker client` talks to the `Docker daemon`, which does the heavy lifting of building, running, and distributing your `Docker containers`. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface. Another Docker client is Docker Compose, that lets you work with applications consisting of a set of containers.

  <p align="center">  <img src="Assets/docker-architecture.webp" </p>
  
#### The Docker daemon
   The Docker daemon `dockerd` listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

#### The Docker client
   The Docker client `docker` is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

### III. Docker CMD <a name="docker-cmd"></a>

| Command | Description |
| :----------- | :----------- |
| docker build . -t `(image)` | This command tells Docker to build an image based on the Dockerfile in the current directory and tag it with the name `(image)`. |
| docker images | list docker images. |
| docker run --name `(ctr)` `(image)`  | start a new Docker container `(ctr)` from an image `(image)`. |
| docker run -d --name ctr image | start a new Docker container `(ctr)` from an image `(image)` in the background. |
| docker run -p `443:443` --name ctr image | The -p option specifies the port mapping. It tells Docker to map port 443 from the container to port 443 on the host machine. The format is <host_port>:<container_port>.|
| docker run -v `VolumeName`:`/path/in/container` ... | This command mounts the volume `VolumeName` inside the container at the specified `/path/in/container` location. |
| docker ps | This command is used to list all the running Docker containers. |
| docker stop `(ctr)` | This command is used to stop a running container. |
| docker rm -f `(ctr)` | This command is used to remove a Docker container. |
| docker rmi -f `(ctr)` | This command is used to remove a Docker image. |
| docker kill | Kill one or more running containers. |
| docker exec -it `(ctr)` bash| start an interactive bash session inside the specified container `(ctr)`.

**NOTE :** 
There are more commands to use with docker but in this table I specified the top essential Docker commands that you might need in the process of creating your own containers.

### IV. How Docker Works ? <a name="how-docker-works"></a>
   Docker is written in the `Go programming language` and takes advantage of several features of the Linux kernel to deliver its functionality. Docker uses a technology called `namespaces` to provide the isolated workspace called the container. When you run a container, Docker creates a set of namespaces for that container.
   
   The process of building Docker images and running containers in relation to Docker, containerd, and runc.


<p align="center">
  <img src="Assets/containerd.png" width="600">
</p>


**Building Docker Images:**

1. When you issue a `docker build` command with a Dockerfile, it is the Docker daemon (`dockerd`) that handles the build process.
2. The Docker daemon reads the Dockerfile instructions and orchestrates the build process. It pulls necessary base images, executes each instruction, and creates the desired image following the defined steps.
3. During the build process, the Docker daemon interacts with containerd to manage the image layers, intermediate containers, and storage operations.


**Running Containers:**

1. When you run a Docker container using the `docker run` command, it is the Docker daemon (`dockerd`) that handles the container creation and execution.
2. The Docker daemon communicates with containerd and instructs it to create a container based on the specified image.
3. Containerd, as the container runtime, then utilizes runc to create and manage the container process with the appropriate namespaces, cgroups, and other isolation mechanisms.

### V. Docker Isolation <a name="docker-isolation"></a>
   Docker utilizes namespaces and cgroups, which are features provided by the Linux kernel, to achieve isolation for each container.


**Namespaces**

   Namespaces play a crucial role in Docker. Docker utilizes namespaces to provide process isolation and resource virtualization, allowing containers to operate as isolated environments within a shared host operating system.

   Here's how namespaces help Docker:

1. Process isolation: Docker uses the PID (Process ID) namespace to provide each container with its own isolated view of processes. Each container has its own set of process IDs, separate from other containers and the host system. This isolation ensures that processes within a container cannot interfere with or access processes outside of it.
2. Network isolation: Docker leverages network namespaces to provide network isolation for containers. Each container has its own isolated network stack, including network interfaces, IP addresses, routing tables, and firewall rules. This isolation allows containers to have their own networking configuration and prevents network conflicts between containers.
3. File system isolation: Mount namespaces enable Docker containers to have their own isolated view of the file system. Each container has its own set of mounted directories and file systems, independent of other containers and the host system. This isolation ensures that changes made within a container's file system do not affect other containers or the host system.
4. User isolation: User namespaces provide user and group ID isolation for Docker containers. They allow containers to have their own set of user and group IDs, separate from the host system. This isolation enhances security by preventing container processes from accessing or affecting the host system's user accounts.

**Cgroups**

   Cgroups, short for control groups, are a feature in the Linux kernel that provide resource isolation and allocation for processes. Cgroups allow you to control and limit the resources (such as CPU, memory, disk I/O, and network bandwidth) that a group of processes can use.
   
   When it comes to Docker containers, cgroups play an important role in resource management and isolation. Docker leverages cgroups to allocate and limit system resources for each container, preventing one container from monopolizing system resources and impacting the performance of other containers or the host system.

**NOTE :** 
   when a process inside a container creates a child process the new child process by default inherits the cgroups and namespaces of he’s parent process.

<p align="center">
  <img src="Assets/namespaces.png" width="500">
</p>


### VI. Does Docker Containers Share the Host OS Kernel? <a name="docker-container-sharing-kernel"></a>

**LinuxOS :**

   On Linux Docker containers share the host operating system's kernel, which means they run on the same kernel as the host machine. This allows containers to be lightweight and provides efficient resource utilization.

**MacOS :**

   On `macOS`, Docker utilizes a lightweight virtualization technology called "Hyperkit" to run Linux containers. Hyperkit is a hypervisor that is part of the Docker Desktop for Mac application. It provides a Linux environment using a virtual machine running on macOS.

   When you install Docker Desktop for Mac on macOS, it includes a small Linux distribution running inside a lightweight virtual machine (Hyperkit).

**WindowsOS:**

   On Windows, Docker Desktop utilizes a different lightweight virtualization technology called "Hyper-V" to run Linux containers. Hyper-V is a native hypervisor developed by Microsoft and is included in certain editions of Windows, such as Windows 10 Professional and Enterprise.

   When Docker Desktop is installed on a Windows machine with Hyper-V enabled, it creates a Linux-based virtual machine (VM) known as the "MobyLinuxVM" to host and manage the Linux containers. This VM runs alongside the Windows operating system and provides the necessary infrastructure for running Docker containers.

## III. MariaDB <a name="mariadb"></a>

### I. Definition <a name="mariadb-definition"></a>

   - `MariaDB` is an open source database to help store and organize data. It’s similar to MySQL (a database management system) and, in fact, a fork to MySQL. The MariaDB database is used for various purposes such as data warehousing, e-commerce, enterprise-level features, and logging applications.
   - `Database` is a place to store information that you can quickly retrieve and use where you need it. Compared to writing information on a piece of paper or in a Word document, a database saves all your information in tables so that you can easily retrieve each individual entry in a systematic and precise way.

### II. History of MariaDB <a name="history-of-mariadb"></a>
   
   - `MySQL` was initially completely open-source , then it was bought by `Oracle`, since then several organizations have become concerned about Oracle's possibility of making paid its software.
   To prevent this, the `MariaDB` foundation creates a version almost identical to MySQL, but completely **open-source**.

### III. MariaDB CMD <a name="mariadb-cmd"></a>

| Command | Description |
| :----------- | :----------- |
| service `mariadb` start | Start the Mariadb server. |
| mysqld_safe `&` | Starts the MariaDB server in safe mode as a background process. The & symbol is used to run the command in the background, allowing the script to continue executing while the server is running. |
| mariadb | Access to mariadb as root user. |
| mariadb -u `user` -p`password` -h `host` | Access mariadb using mariadb-client from another machine. -u `user` specifies the username to use when connecting to the database server. `-p...` is used to provide the password for the specified user {no space between -p and the password}. `-h ...` specifies the hostname or IP address of the machine where the MariaDB database server is running. |
| show databases; | Reveal all mariadb databases. |
| use `(name of a database)`; | Acces to that specific database. |
| create database `(name of new database)`; | Create a database. |
| show tables; | Reveal all tables of that database. |
| create table `(name of new table)(arg1, arg2,…)`; | Creating a new table. |
| explain `(name of a table)`; | Reveal all the arguments of that table. |
| select * from `(name of a table)`; | Reveal the table values. |
| insert `(table()) value(arg1, arg2, arg3..)`; | Insert values to a specific table. |
| update `(table)` set `(the value to change)`=`new value` where std_id=`2`; | Change an added value. |
| select user from `mysql.user`; | Reveal mariadb users. |
| create user `user`@`%`; | Creat user, `%` represents the host or the location from which the user is allowed to connect. The '%' wildcard symbol means that the user can connect from any host. If you want to restrict connections to specific hosts, you can replace '%' with the desired hostname or IP address. |
| create user `user`@`localhost` identified by `password`; | Create user with a password, the localhost will make the user only acces the mariadb from the hostmachine that's running the mariadb server.|
| drop user `user`@`localhost`; | Drop user. |
| GRANT ALL PRIVILEGES ON `*.*` TO `user`@`%`; | This command grants all privileges (ALL PRIVILEGES) to the user `user` for all databases `(*.*)` and all tables within those databases. |
| FLUSH PRIVILEGES; | Ensure the changes take effect. |








### IV. MariaDB Configuration <a name="mariadb-configuration"></a>

## IV. WordPress <a name=" "></a>

### Definition <a name=" "></a>

WordPress is a popular open-source content management system (CMS)... 

### WordPress Configuration <a name=" "></a>

## V. Nginx <a name=" "></a>

### Definition <a name=" "></a>

### HTTPS 

### SSL

### Nginx Configuration

## VI. Resources
