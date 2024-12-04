# Use the official Python image from Docker Hub as the base image
FROM python:3.11-slim

# Ensure that Flask uses the correct version of Werkzeug
RUN pip install werkzeug==2.1.0

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY app.py /app/app.py

# Install any needed dependencies specified in requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the outside world
EXPOSE 5000


# Run the Flask app when the container starts
CMD ["flask", "run"]
