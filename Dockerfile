FROM openjdk:26-ea-17-jdk-slim
WORKDIR /app
COPY target/* app.jar
ENTRYPOINT ["java","-jar","app.jar"]

