# 🗃 Multi-Database Docker Stack with Jupyter Notebook

## Overview
This project sets up a **multi-database environment** using Docker Compose, including:

- **InfluxDB** (Time-series database)
- **PostgreSQL** (Relational database)
- **Cassandra** (NoSQL database)
- **Jupyter Notebook** (Python/Anaconda environment for querying databases)

The goal is to create a **development and learning stack** where all services run in containers and can interact through a Docker network.

---

## 🐳 What is Docker?

Docker is a platform for **containerization**, allowing developers to package applications and their dependencies into **lightweight, portable containers** that run consistently across different environments.

### Key Concepts:

- **Containers**: Standalone, executable packages containing everything an application needs (code, runtime, libraries, environment variables).  
- **Images**: Read-only templates used to create containers.  
- **Docker Compose**: Tool for defining and running multi-container Docker applications using a YAML file.  

**Benefits**:  
- Consistency across environments  
- Easy isolation of services  
- Simple deployment and scaling  

---

## ⚙️ Project Stack

### 1. **InfluxDB**
- **Image**: `influxdb:2.7`  
- **Ports**: `8086`  
- **Environment**: Admin user/password, bucket, org  
- **Volume**: `influxdb_data:/var/lib/influxdb2`  

### 2. **PostgreSQL**
- **Image**: `postgres:15`  
- **Ports**: `5432`  
- **Environment**: DB name, user, password  
- **Volume**: `postgres_data:/var/lib/postgresql/data`  

### 3. **Cassandra**
- **Image**: `cassandra:4.1`  
- **Ports**: `9042`  
- **Environment**: Cluster name, token count  
- **Volume**: `cassandra_data:/var/lib/cassandra`  

### 4. **Jupyter Notebook**
- **Image**: `jupyter/minimal-notebook:latest`  
- **Ports**: `8888`  
- **Environment**: `JUPYTER_TOKEN` for secure login

---

## 🔗 Service Interactions

- **InfluxDB** handles **time-series data** (metrics, logs, IoT signals).  
- **PostgreSQL** stores structured relational data.  
- **Cassandra** stores scalable NoSQL datasets for high availability.  
- **Jupyter Notebook** can connect to all three databases using Python, allowing data analysis, visualization, and queries in one environment.  

---
db-stack/
│
├─ docker-compose.yml
├─ README.md


---

##  Getting Started

### 1. Start the Docker Stack
```powershell
cd C:\Users\USER\db-stack
docker-compose up -d
 docker ps

##Expected containers: influxdb, postgres, cassandra, jupyter

3. Access Jupyter Notebook

URL: http://localhost:8888

Token: mytoken123 (as defined in docker-compose.yml) 📂 Directory Structure

