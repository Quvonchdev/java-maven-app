FROM openjdk:8-jre-alpine

WORKDIR /app

COPY /var/jenkins_home/workspace/maven-job2/target/java-maven-app-1.1.0-SNAPSHOT.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
