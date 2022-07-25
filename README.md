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


ref:

- <https://dzone.com/articles/multi-stage-docker-image-build-for-java-apps>
- <https://codefresh.io/blog/java_docker_pipeline/>