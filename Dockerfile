FROM maven:3.8.6 AS build
WORKDIR /app
COPY . .
RUN mvn clean package
RUN mkdir -p /app/target


FROM openjdk:17-jdk
WORKDIR /app
COPY --from=build /app/target/myapp.jar myapp.jar
ENTRYPOINT ["java", "-jar", "myapp.jar"]
