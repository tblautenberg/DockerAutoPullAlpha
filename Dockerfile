FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk maven && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the JavaDockerContainerAutoPull and DockerTargetProgram directories
COPY JavaDockerContainerAutoPull /app/JavaDockerContainerAutoPull
COPY DockerTargetProgram /app/DockerTargetProgram
