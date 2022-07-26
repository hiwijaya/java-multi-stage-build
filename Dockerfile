FROM openjdk:11-jdk as builder

RUN mkdir -p /app/source
COPY . /app/source
WORKDIR /app/source
RUN ./mvnw clean package


FROM openjdk:11-jre as runtime

ARG JAR_FILE=/app/source/target/*.jar
COPY --from=builder ${JAR_FILE} /app/java-application.jar

EXPOSE 8080

CMD java -jar /app/java-application.jar