# DevOps Setup with Docker

This project shows how to build a simple DevOps stack using Docker and Docker Compose. The setup runs multiple database services in containers. Each container operates independently and communicates through a shared network. The goal is to demonstrate DevOps principles such as automation, containerization, and system consistency.

---

## Understanding DevOps and Docker

**DevOps** combines development and operations work. It reduces manual steps and speeds up delivery. It focuses on automation, collaboration, and reliability. It supports Continuous Integration and Continuous Deployment.

**Docker** packages applications with their dependencies into portable containers. These containers run the same across all systems. Docker Compose uses one configuration file to start multiple services together.

This project uses Docker Compose to automate container creation, networking, and volume setup. It provides a small-scale example of how real systems deploy and manage multiple connected services.

---

## System Architecture Overview
<img width="1214" height="1069" alt="Fruits (1)" src="https://github.com/user-attachments/assets/64a2c5e1-5661-426e-8702-6cd074ba4c94" />

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
<img width="1582" height="896" alt="Screenshot 2025-10-19 181010" src="https://github.com/user-attachments/assets/86eafe14-72eb-4d68-a680-6592407d39e6" />

### Step 2: Clone the Repository
<img width="1577" height="882" alt="Screenshot 2025-10-19 181115" src="https://github.com/user-attachments/assets/f2d3df2c-a761-431f-82ac-e10525def6b2" />

Open a terminal and run:

```
git clone https://github.com/Duaby/dev-ops.git  
cd dev-ops
```

### Step 3: Start the Services

Pull images and start containers:
<img width="1575" height="876" alt="Screenshot 2025-10-19 181413" src="https://github.com/user-attachments/assets/0cd4b144-1e9c-4020-8771-10fa1772119e" />

```
docker compose up -d
```

This command downloads images, creates containers, and sets up volumes.

### Step 4: Check Running Containers
<img width="1577" height="840" alt="Screenshot 2025-10-19 181722" src="https://github.com/user-attachments/assets/0b0822e8-aaf9-497c-806a-88c9794c5de7" />

List active containers:

```
docker ps
```

You should see InfluxDB, PostgreSQL, and Cassandra.
<img width="1916" height="980" alt="Screenshot 2025-10-19 181615" src="https://github.com/user-attachments/assets/e52dd0dc-0f26-4fa3-992a-d368942a0a70" />

### Step 5: Access the Services

* InfluxDB: open [http://localhost:8086](http://localhost:8086) (user: admin / password: admin123)
<img width="1581" height="881" alt="Screenshot 2025-10-19 182034" src="https://github.com/user-attachments/assets/61e4ca71-2b27-412f-ad03-934da5f5b4aa" />

* PostgreSQL: connect on port 5432 (user: postgres / password: postgres123 / db: mydb)

* Cassandra: connect on port 9042

* Juypter
<img width="1581" height="893" alt="Screenshot 2025-10-19 182044" src="https://github.com/user-attachments/assets/f0bc50e5-3573-4d90-a4a0-26d8438a4df1" />

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
