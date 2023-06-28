FROM maven:3.8.3-openjdk-17 AS builder
COPY . .
RUN mvn clean package -Dmaven.test.skip=true
FROM maven:3.8.3-openjdk-17
COPY --from=builder /target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
USER 1002
ENTRYPOINT ["java", "-jar", "/app/demo-0.0.1-SNAPSHOT.jar"]

