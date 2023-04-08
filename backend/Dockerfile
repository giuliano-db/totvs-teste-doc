#FROM maven:3.8.4-jdk-17 as build
FROM maven:3.8.4-openjdk-17 as build
WORKDIR /app

RUN git clone https://github.com/giuliano-db/totvs-teste-backend.git

WORKDIR /app/totvs-teste-backend

RUN mvn clean package

FROM openjdk:17-jdk-alpine

COPY --from=build /app/totvs-teste-backend/target/*.jar /app/app.jar

EXPOSE 8080

CMD ["java", "-jar", "/app/app.jar"]