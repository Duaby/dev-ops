# Docker Stack: InfluxDB, PostgreSQL, Cassandra

## Description
This project sets up **InfluxDB, PostgreSQL, and Apache Cassandra** using Docker Compose on a Windows machine. Each database runs in its own container with exposed ports and persistent storage via Docker volumes. This setup is ideal for local development, testing, or learning purposes.

---

## Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed on Windows
- PowerShell or Command Prompt
- Optional:
  - `psql` CLI or GUI tool (DBeaver, PgAdmin) for PostgreSQL
  - `cqlsh` for Cassandra
  - Browser for InfluxDB UI

---

## Project Structure



 
---

## Docker Compose Configuration

### Services

| Service      | Image        | Port   | Username | Password       | Notes                     |
|-------------|-------------|-------|---------|----------------|---------------------------|
| InfluxDB    | influxdb:2.7 | 8086  | admin   | admin123       | Bucket: `mybucket`, Org: `myorg` |
| PostgreSQL  | postgres:15 | 5432  | postgres | postgres123   | Database: `mydb`         |
| Cassandra   | cassandra:4.1 | 9042 | N/A     | N/A            | Default CQL shell access  |

### Volumes
- `influxdb_data` → `/var/lib/influxdb2`
- `postgres_data` → `/var/lib/postgresql/data`
- `cassandra_data` → `/var/lib/cassandra`

---

## Steps to Run

1. **Open PowerShell** and navigate to the project folder:

```powershell
cd C:\Users\USER\db-stack
