#!/bin/bash

# Print current directory for debugging
echo "Current directory: $(pwd)"

# Verify if the JAR file exists
if [ -f "Java-DAP-1.0-SNAPSHOT.jar" ]; then
    # Run the JAR file
    echo "Executing JAR file..."
    java -jar Java-DAP-1.0-SNAPSHOT.jar
    # Check the exit status of the previous command
    if [ $? -eq 0 ]; then
        echo "JAR execution finished successfully."
        
        # Move to /app/target-repo and run mvn clean package
        cd /app/target-repo
        echo "Moving to /app/target-repo and running mvn clean package..."
        mvn clean package
        if [ $? -eq 0 ]; then
            echo "mvn clean package finished successfully."
            
            # Move to target folder and run RunMe-1.0-SNAPSHOT.jar
            cd target
            echo "Moving to target folder and executing RunMe-1.0-SNAPSHOT.jar..."
            java -jar RunMe-1.0-SNAPSHOT.jar
            if [ $? -eq 0 ]; then
                echo "RunMe-1.0-SNAPSHOT.jar execution finished successfully."
            else
                echo "Error: Failed to execute RunMe-1.0-SNAPSHOT.jar."
            fi
        else
            echo "Error: Failed to run mvn clean package."
        fi
    else
        echo "Error: Failed to execute JAR file."
    fi
else
    echo "Error: JAR file not found."
fi

# Print completion message
echo "Script execution completed."
