# Use OpenJDK 24 as the base image
FROM openjdk:24-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot JAR file into the container
COPY target/myapp.jar myapp.jar

# Expose the application port
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "myapp.jar"]
