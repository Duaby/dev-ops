# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python app
COPY app.py .

# Expose port 5000 from the container
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]