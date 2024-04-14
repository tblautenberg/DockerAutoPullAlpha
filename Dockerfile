FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk maven && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the JavaDockerContainerAutoPull directory
COPY JavaDockerContainerAutoPull /app/JavaDockerContainerAutoPull

# Change working directory to the JavaDockerContainerAutoPull directory
WORKDIR /app/JavaDockerContainerAutoPull

# Build the Java project using Maven
RUN mvn clean package

# Move the built JAR file to the /app directory
RUN mv target/JavaDockerContainerAutoPull-1.0-SNAPSHOT.jar /app

# Set the working directory back to /app
WORKDIR /app

# Specify the /app directory as a volume
VOLUME /app

# Specify the command to run on container startup
CMD ["java", "-jar", "JavaDockerContainerAutoPull-1.0-SNAPSHOT.jar"]
