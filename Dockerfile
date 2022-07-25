FROM openjdk:11-jdk

RUN mkdir -p /app
WORKDIR /app

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} java-application.jar

EXPOSE 8080

CMD java -jar java-application.jar