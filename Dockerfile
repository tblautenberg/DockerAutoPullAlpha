FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk maven && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the Java-DAP directory
COPY Java-DAP /app/Java-DAP

# Change working directory to the Java-DAP directory
WORKDIR /app/Java-DAP

# Build the Java project using Maven
RUN mvn clean package

# Move the built JAR file to the /app directory
RUN mv target/Java-DAP-1.0-SNAPSHOT.jar /app

# Set the working directory back to /app
WORKDIR /app

# Copy a script that runs the JAR and executes a bash command after it finishes
COPY bashScript.sh /app/bashScript.sh

# Give execute permissions to the script AND fix the bash file with extra scripts :3
RUN chmod +x /app/bashScript.sh
RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix /app/bashScript.sh



# Specify the command to run on container startup
CMD ["/app/bashScript.sh"]
