# Use the official Amazon Linux image as a parent image
FROM amazonlinux:3

# Install system dependencies and development tools
RUN yum update -y
RUN yum install -y gcc openssl-devel bzip2-devel libffi-devel make wget tar gzip mysql-devel

# Download and install Python 3.7
RUN wget https://www.python.org/ftp/python/3.7.12/Python-3.7.12.tgz
RUN tar xzf Python-3.7.12.tgz
RUN cd Python-3.7.12 && ./configure --enable-optimizations && make altinstall
RUN rm Python-3.7.12.tgz

# Create a symlink for pip
RUN ln -s /usr/local/bin/pip3.7 /usr/local/bin/pip

# Upgrade pip
RUN pip install --upgrade pip

# Set the working directory inside the container
WORKDIR /app

# Copy your application code into the container
COPY . .

# Install your application's dependencies within the virtual environment
RUN pip install --upgrade -r requirements.txt

# Set the command to run your application
CMD ["python3.7", "app.py"]
