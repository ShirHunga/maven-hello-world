FROM maven:3.9.6-eclipse-temurin-17 AS Build
WORKDIR /app
COPY myapp/pom.xml .
RUN mvn dependency:go-offline
COPY myapp/src ./src
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre AS PROD
RUN useradd -m appuser
WORKDIR /app
COPY --from=Build /app/target/*.jar app.jar
RUN chown -R appuser:appuser /app
USER appuser
ENTRYPOINT ["java", "-jar", "app.jar"]
