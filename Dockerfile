# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Expose the port your app runs on
EXPOSE 5000

# Define environment variables
ENV FLASK_APP=app.py

# Start your application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
