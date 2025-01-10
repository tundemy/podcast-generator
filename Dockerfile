# Use Ubuntu as a base image
FROM ubuntu:latest

# Install Python 3.10, pip, and git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install PyYAML
RUN pip3 install PyYAML

# Copy feed.py to the container
COPY feed.py /usr/bin/feed.py

# Copy entrypoint.sh to the container and set it up to be executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the entrypoint script to start the container
ENTRYPOINT ["/entrypoint.sh"]
