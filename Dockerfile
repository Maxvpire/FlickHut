FROM maven:3.8.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:24-jdk
WORKDIR /app
COPY --from=build /app/target/myapp.jar myapp.jar
ENTRYPOINT ["java", "-jar", "myapp.jar"]