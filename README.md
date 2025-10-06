# 🚀 DevOps & Multi-Database Stack with Docker

This project sets up and runs a **multi-database environment** using Docker containers.  
The stack includes:
- 🟠 **InfluxDB** — Time series database  
- 🟡 **PostgreSQL** — Relational database  
- 🟣 **Apache Cassandra** — NoSQL distributed database

All services run inside **Docker containers** and are orchestrated using **Docker Compose**.

---

## 🧠 What is DevOps?

**DevOps** is a combination of **“Development”** and **“Operations.”**  
It’s a set of cultural philosophies, practices, and tools that aims to:
- **Bridge the gap** between software development and IT operations.  
- **Automate** and **integrate** the processes of building, testing, and releasing software.  
- Enable **faster development cycles**, **high-quality software**, and **continuous delivery**.

### ✨ Key DevOps Principles
- **Collaboration** between dev and ops teams.  
- **Continuous Integration / Continuous Deployment (CI/CD)**.  
- **Automation** of builds, tests, and deployments.  
- **Monitoring & Feedback** to improve systems quickly.  

Using **Docker** and **Docker Compose** is a core part of many DevOps workflows.  
It helps create **consistent, reproducible environments** from development to production, which is essential for reliable software delivery.

---

## 🧰 What is Docker?

**Docker** is a platform that allows developers to **package and run applications** inside **containers**.  
These containers include everything needed to run the software—code, runtime, libraries, and settings—making it easy to move applications between environments without issues.

### ⚙️ How Docker Works
- You write a **Dockerfile** describing your environment.  
- You build a **Docker image** from that file.  
- You run **containers** from the image, each acting as a lightweight, isolated environment.  
- **Docker Compose** lets you define and run **multiple containers** together in a single configuration file.

---

## 🧱 What are Containers?

Containers are like **lightweight virtual machines**, but:
- They **share the host’s OS kernel**, making them efficient and fast.  
- They **start in seconds** and use fewer resources.  
- They’re **portable** — the same container runs the same way anywhere.  
- Each service (e.g., PostgreSQL or InfluxDB) runs in **its own container** but can communicate with others over a shared network.

---

## 📄 Docker Compose Setup

Below is the `docker-compose.yml` file used to set up the databases:

```yaml
version: '3.8'

services:
  influxdb:
    image: influxdb:2.7
    container_name: influxdb
    ports:
      - "8086:8086"
    environment:
      - DOCKER_INFLUXDB_INIT_MODE=setup
      - DOCKER_INFLUXDB_INIT_USERNAME=admin
      - DOCKER_INFLUXDB_INIT_PASSWORD=admin123
      - DOCKER_INFLUXDB_INIT_ORG=myorg
      - DOCKER_INFLUXDB_INIT_BUCKET=mybucket
    volumes:
      - influxdb_data:/var/lib/influxdb2

  postgres:
    image: postgres:15
    container_name: postgres
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER=admin
      - POSTGRES_PASSWORD=admin123
      - POSTGRES_DB=mydatabase
    volumes:
      - postgres_data:/var/lib/postgresql/data

  cassandra:
    image: cassandra:4.1
    container_name: cassandra
    ports:
      - "9042:9042"
    environment:
      - CASSANDRA_CLUSTER_NAME=TestCluster
      - CASSANDRA_NUM_TOKENS=256
    volumes:
      - cassandra_data:/var/lib/cassandra

volumes:
  influxdb_data:
  postgres_data:
  cassandra_data:
