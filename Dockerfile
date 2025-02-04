# Use a base image with Java runtime
FROM openjdk:11-jre-slim

# Accept a build argument for the JAR file name
ARG JAR_FILE

# Copy the JAR file into the Docker image
COPY ${JAR_FILE} /app/specific-service-repo.jar

# Set the working directory
WORKDIR /app

# Command to run the JAR file
CMD ["java", "-jar", "specific-service-repo.jar"]
