FROM amazoncorretto:8-alpine3.16-jdk

WORKDIR /app

COPY /target/*.jar /app.jar

CMD [ "java", "-jar", "app.jar" ]