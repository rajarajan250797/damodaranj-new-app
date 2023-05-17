# Use a base image with Java pre-installed
FROM openjdk:11

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file to the container
COPY target/newapp.war /app/your-application.jar

# (Optional) If your application requires additional files or dependencies, copy them to the container as well
# COPY additional-files /app/additional-files

# Expose the port on which your application listens
EXPOSE 8080

# Set the command to run your application when the container starts
CMD ["java", "-jar", "your-application.jar"]

