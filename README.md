# 🧰 DevOps Stack Setup with Docker 🐳

This project demonstrates how to set up and run a basic DevOps stack using **Docker** and **Docker Compose**, including multiple services (application + databases) working together in isolated containers.

---

## 🧭 1. What is Ops?

**Ops** (short for **Operations**) refers to the set of tasks, responsibilities, and processes involved in **running, managing, and maintaining software systems** after development.  
Typical Ops responsibilities include:

- Deploying applications to servers or cloud environments  
- Managing infrastructure and networks  
- Monitoring system performance  
- Ensuring security, scalability, and availability  
- Handling updates, patches, and incident response  

---

## 🚀 2. What is DevOps?

**DevOps** is a cultural and technical movement that brings together **Development (Dev)** and **Operations (Ops)** teams to **collaborate more efficiently**, automate processes, and deliver software faster and more reliably.

Key DevOps principles include:

- **Automation** of repetitive tasks (e.g., testing, deployment)  
- **Continuous Integration / Continuous Deployment (CI/CD)**  
- **Infrastructure as Code** (e.g., Docker, Terraform)  
- **Collaboration** between development and operations teams  
- **Monitoring and feedback loops**

---

## 🐳 3. What is Docker?

**Docker** is a platform that allows you to **package applications and their dependencies into containers**, ensuring they run consistently across different environments (development, staging, production).

### 🧠 How Docker Works

- **Dockerfile** → Instructions for building an image  
- **Image** → A lightweight, immutable snapshot of an environment (code + dependencies)  
- **Container** → A running instance of an image (isolated, portable environment)  
- **Docker Engine** → Manages images, containers, networking, and volumes  

With Docker, you no longer need to manually set up environments on each machine — everything is defined as code and can be started with a single command.

---

## 📦 4. What are Containers?

A **container** is a lightweight, isolated, and portable environment that runs an application along with everything it needs — libraries, system tools, runtime, etc.  

Think of containers like shipping containers:
> Each one holds everything it needs and can run anywhere, regardless of the host system.

---

## 📝 5. Project Overview

We use **Docker Compose** to orchestrate multiple services together.  
Our stack includes:

1. **Application Service (`infloob`)**
2. **Relational Database (`postgres`)**
3. **NoSQL Database (`cassandra`)**

All services run in separate containers but communicate through Docker's internal network.

---

## 🧱 6. Services Explained

### 🌐 **1. infloob (Main Application)**

- **Image**: `infloob/infloob:2.7`  
- **Port**: `8080`  
- **Purpose**: Runs the core application. It connects to PostgreSQL and Cassandra to handle data storage and retrieval.  
- **Persistence**: Data is stored in a Docker volume (`infloob_data`).

---

### 🛢 **2. postgres (Relational Database)**

- **Image**: `postgres:15`  
- **Port**: `5432`  
- **Purpose**: Stores structured data (e.g., user accounts, transactions, metadata).  
- **Persistence**: Uses the `postgres_data` volume to keep database files even if the container restarts.

---

### 🌿 **3. cassandra (NoSQL Database)**

- **Image**: `cassandra:4.1`  
- **Port**: `9042`  
- **Purpose**: Handles high-volume or unstructured data efficiently. Useful for fast reads/writes and scalable workloads.  
- **Persistence**: Uses the `cassandra_data` volume.

---

## ⚙️ 7. Running the Stack

Follow these steps to set up and run the stack:

### ✅ Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed  
- [Docker Compose](https://docs.docker.com/compose/) installed  

---

### 📥 Step 1: Clone the Repository
```bash
git clone https://github.com/your-username/your-repo.git
cd your-repo
