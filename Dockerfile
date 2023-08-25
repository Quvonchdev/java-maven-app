FROM openjdk:8-jre-alpine

WORKDIR /app

COPY /var/lib/docker/volumes/jenkins_home/_data/workspace/maven-job2/target/java-maven-app-1.1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
