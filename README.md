# Docker multi-stage builds

### basic

``` dockerfile
FROM openjdk:11-jdk

RUN mkdir -p /app
WORKDIR /app

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} java-application.jar

EXPOSE 8080

CMD java -jar java-application.jar
```

### multi-stage build

``` dockerfile
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
```

ref:

- <https://dzone.com/articles/multi-stage-docker-image-build-for-java-apps>
- <https://codefresh.io/blog/java_docker_pipeline/>
- <https://spring.io/guides/topicals/spring-boot-docker/>