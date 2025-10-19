# DevOps Setup with Docker

This project shows how to build a simple DevOps stack using Docker and Docker Compose. The setup runs multiple database services in containers. Each container operates independently and communicates through a shared network. The goal is to demonstrate DevOps principles such as automation, containerization, and system consistency.

---

## Understanding DevOps and Docker

**DevOps** combines development and operations work. It reduces manual steps and speeds up delivery. It focuses on automation, collaboration, and reliability. It supports Continuous Integration and Continuous Deployment.

**Docker** packages applications with their dependencies into portable containers. These containers run the same across all systems. Docker Compose uses one configuration file to start multiple services together.

This project uses Docker Compose to automate container creation, networking, and volume setup. It provides a small-scale example of how real systems deploy and manage multiple connected services.

---

## System Architecture Overview

The stack includes three main services:

* **InfluxDB** for time-series data
* **PostgreSQL** for relational data
* **Cassandra** for NoSQL data

Each service runs in its own container. All containers connect through a shared Docker network. Data is stored in persistent volumes so it remains available after restarts.

---

### Service Details

| Service    | Port | Purpose                                   |
| ---------- | ---- | ----------------------------------------- |
| InfluxDB   | 8086 | Time-series database for metrics and logs |
| PostgreSQL | 5432 | Relational database for structured data   |
| Cassandra  | 9042 | NoSQL database for fast, scalable storage |

Persistent volumes store data safely and allow recovery after shutdown.

---

## Step-by-Step Setup (Windows)

### Step 1: Install Docker Desktop

Download and install Docker Desktop from the official site. Open it and confirm it runs correctly.

### Step 2: Clone the Repository

Open a terminal and run:

```
git clone https://github.com/Duaby/dev-ops.git  
cd dev-ops
```

### Step 3: Start the Services

Pull images and start containers:

```
docker compose up -d
```

This command downloads images, creates containers, and sets up volumes.

### Step 4: Check Running Containers

List active containers:

```
docker ps
```

You should see InfluxDB, PostgreSQL, and Cassandra.

### Step 5: Access the Services

* InfluxDB: open [http://localhost:8086](http://localhost:8086) (user: admin / password: admin123)
* PostgreSQL: connect on port 5432 (user: postgres / password: postgres123 / db: mydb)
* Cassandra: connect on port 9042

---

## Networking and Data Persistence

All containers share one network called `devops-net`. Each service can be reached by its name. You do not need IP addresses.

Persistent volumes store database files outside the containers. Data remains after containers are stopped or deleted. List existing volumes with:

```
docker volume ls
```

---

## Troubleshooting

* Free ports 8086, 5432, and 9042 before starting.
* Use `sudo` if Docker requires root access.
* Check logs if containers fail:

```
docker compose logs
```

* Reset everything if setup breaks:

```
docker compose down -v --remove-orphans  
docker compose up -d
```

---

## Learning Outcomes

* **Automation**: Run multiple containers using one command.
* **Containerization**: Create isolated environments for each service.
* **Networking**: Link services through a shared Docker network.
* **Persistence**: Keep data using Docker volumes.
* **Service Management**: Start, stop, and inspect containers through Docker CLI.
* **System Simulation**: Model a small multi-database setup like in real DevOps pipelines.

---

## Conclusion

This project demonstrates how Docker and Docker Compose simplify multi-service systems. It shows how DevOps principles improve setup speed, stability, and scalability. The setup provides a hands-on example of running and maintaining containerized environments with minimal manual work.
