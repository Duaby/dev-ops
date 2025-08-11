My Docker Web Application 🐳
A simple web application packaged in a Docker container. This project demonstrates a basic Python application that can be easily run and shared using Docker.

Description
This repository contains the source code for a basic web application, which is configured to run as a Docker container. The Dockerfile provides all the instructions needed to create a self-contained, portable environment for the app, making it easy for anyone to get it running without worrying about dependencies.

Getting Started
Prerequisites
To use this project, you need to have Docker and Git installed on your system.

Install Docker

Install Git

Installation
Follow these steps to get a copy of the project running on your local machine.

Clone the repository:

git clone https://github.com/Duaby/dev-ops.git

Navigate to the project directory:

cd dev-ops

Build the Docker image:
This command will use the Dockerfile to build a new image named my-web-app.

docker build -t my-web-app .

Usage
Once the image is built, you can run the application in a Docker container.

Run the container:
This command runs the container and maps port 8000 on your host machine to port 5000 inside the container, where the application is running.

docker run -p 8000:5000 my-web-app

Access the application:
Open your web browser and navigate to http://localhost:8000 to see the application in action.

Sharing via Docker Hub
To share this application with others, you can push the built Docker image to Docker Hub.

Tag the image with your Docker Hub username:

docker tag my-web-app your-dockerhub-username/my-web-app:1.0

Push the image to Docker Hub:

docker push your-dockerhub-username/my-web-app:1.0

Others can then pull and run the image directly without building it themselves:

docker pull your-dockerhub-username/my-web-app:1.0
docker run -p 8000:5000 your-dockerhub-username/my-web-app:1.0
