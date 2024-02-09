FROM maven:3-eclipse-temurin-21-alpine As build
COPY . .
Run mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/demo-0.0.1-SNAPSHOT.jar"]