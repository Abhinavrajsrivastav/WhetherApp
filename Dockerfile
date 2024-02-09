# Stage 1: Build stage using Maven
FROM maven:3-eclipse-temurin-21-alpine AS build
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Create final image using JDK and the JAR file from the build stage
FROM openjdk:21-jdk-slim
COPY --from=build demo/target/WhetherApp.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]
