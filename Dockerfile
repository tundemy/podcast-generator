FROM ubuntu:latest

# Install Python, pip, and git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3-venv  # Add python3-venv to create a virtual environment

# Create a virtual environment for Python
RUN python3 -m venv /venv

# Install PyYAML within the virtual environment
RUN /venv/bin/pip install --upgrade pip
RUN /venv/bin/pip install PyYAML

# Copy your feed.py into the container
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set the virtual environment as the default Python environment
ENV PATH="/venv/bin:$PATH"

# Set the entrypoint to the shell script
ENTRYPOINT ["/entrypoint.sh"]
