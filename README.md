DevOps Stack Setup with Docker

This project shows you how to set up a basic DevOps stack. You use Docker and Docker Compose. The stack includes multiple services. They run in isolated containers.

What is Ops?

Ops means the tasks for running and maintaining software after development. Ops includes deploying applications to servers. It includes managing infrastructure and networks. It includes monitoring performance. It includes ensuring security, scalability, and availability. It includes handling updates and incident response.

What is DevOps?

DevOps brings development and operations teams together. It helps them collaborate. It automates processes. It delivers software faster. Key principles include automation of tasks. It includes continuous integration and deployment. It includes infrastructure as code. It includes collaboration between teams. It includes monitoring and feedback loops.

What is Docker?

Docker packages applications and dependencies into containers. Containers run consistently across environments. This includes development, staging, and production.

How Docker Works

Dockerfile builds an image. Image is a snapshot of an environment. Container is a running instance of an image. Docker Engine manages images, containers, networking, and volumes. You define environments as code. You start them with one command.

What are Containers?

Container is a lightweight, isolated environment. It runs an application with libraries, tools, and runtime. Container holds what it needs. It runs anywhere.

Project Overview

You use Docker Compose to orchestrate services. Stack includes time-series database, relational database, and NoSQL database. Services run in separate containers. They communicate through Docker network.

Services Explained

influxdb (Time-Series Database)

Image: influxdb:2.7
Port: 8086
Purpose: Stores time-series data. Use it for metrics, logs, and analytics.
Persistence: Uses influxdb_data volume.

postgres (Relational Database)

Image: postgres:15
Port: 5432
Purpose: Stores structured data. Use it for accounts, transactions, and metadata.
Persistence: Uses postgres_data volume.

cassandra (NoSQL Database)

Image: cassandra:4.1
Port: 9042
Purpose: Handles high-volume data. Use it for fast reads and writes.
Persistence: Uses cassandra_data volume.

Running the Stack

Prerequisites
Install Docker.
Install Docker Compose.

Step 1: Clone the Repository
Run this command.
git clone https://github.com/Duaby/dev-ops.git
cd dev-ops

Step 2: Start the Services
Run this command.
docker-compose up -d
Command pulls images. It creates containers. It sets up volumes.

Step 3: Wait for Services to Initialize
InfluxDB takes 1-2 minutes.
PostgreSQL takes 30 seconds.
Cassandra takes 1-2 minutes.
Check status with this command.
docker-compose ps

Step 4: Access the Services
Access InfluxDB at http://localhost:8086. Use admin/admin123.
Connect to PostgreSQL on port 5432. Use postgres/postgres123/mydb.
Connect to Cassandra on port 9042.

Step 5: Verify Functionality
Log in to InfluxDB UI. Create bucket or query data.
Run SELECT version(); in PostgreSQL.
Run DESCRIBE CLUSTER; in Cassandra.

Stopping the Stack

Stop services without removing containers.
docker-compose stop

Stop and remove containers, networks, and volumes.
docker-compose down

Remove volumes.
docker-compose down -v

Troubleshooting

Common Issues
Check ports 8086, 5432, 9042 are free.
Run Docker with sudo if needed.
Wait for pulls on slow connections.
Remove volumes if corrupted.

Logs
View logs for influxdb.
docker-compose logs influxdb
View logs for postgres.
docker-compose logs postgres
View logs for cassandra.
docker-compose logs cassandra
View all logs.
docker-compose logs

Reset Everything
Run this to reset.
docker-compose down -v --remove-orphans
docker-compose up -d

Usage Examples

InfluxDB
Write data with CLI or API.
Query data with Flux in UI or API.

PostgreSQL
Connect with psql -h localhost -p 5432 -U postgres -d mydb
Create table with CREATE TABLE test (id SERIAL PRIMARY KEY, name VARCHAR(50));

Cassandra
Connect with cqlsh localhost 9042
Create keyspace with CREATE KEYSPACE test WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};

Contributing

Submit issues or pull requests.

License

Project is open-source. See LICENSE.
