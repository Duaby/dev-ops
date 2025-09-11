# 📄 Diagram Overview: `docker-compose.yml` Visualization

This document explains the structure and components of our application stack as defined in the `docker-compose.yml` file. The diagram provides a clear overview of the services, their configurations, and how they interact.

---

## ⚙️ Core Services

The application is composed of three main services, all defined and orchestrated by Docker Compose:

### **`influxdb`**
- **Image**: `influxdb:2.7`  
- **Ports**: Exposes `8086` for the InfluxDB Web UI and API.  
- **Configuration**: Uses environment variables to configure the admin user, password, bucket, and organization.  
- **Persistence**: Mounts the **`influxdb_data`** volume to `/var/lib/influxdb2` to store time-series data.  

### **`postgres`**
- **Image**: `postgres:15`  
- **Ports**: Exposes `5432`, the standard PostgreSQL port.  
- **Configuration**: Uses environment variables to set the database name, user, and password.  
- **Persistence**: Mounts the **`postgres_data`** volume to `/var/lib/postgresql/data` to persist database files.  

### **`cassandra`**
- **Image**: `cassandra:4.1`  
- **Ports**: Exposes `9042`, the standard port for Cassandra’s native protocol.  
- **Configuration**: Environment variables are used to configure the cluster name and token settings.  
- **Persistence**: Mounts the **`cassandra_data`** volume to `/var/lib/cassandra` to ensure durable storage.  

---

## 🔗 Service Interactions

This setup represents a typical multi-database environment for development or learning:  

- **InfluxDB** handles **time-series data** (metrics, logs, IoT signals).  
- **PostgreSQL** provides a **relational database** for structured data.  
- **Cassandra** stores **scalable NoSQL datasets** for high availability and fast reads/writes.  

Each service runs independently in its own container but can communicate with others using Docker’s internal network. This design allows the application stack to simulate real-world scenarios where multiple database systems coexist and serve different data needs.
