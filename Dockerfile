FROM maven:3.9.9-eclipse-temurin-11 AS build
WORKDIR /workspace

COPY pom.xml ./
COPY .mvn .mvn
COPY mvnw ./
RUN chmod +x mvnw

COPY resources resources
COPY src src
COPY test test

RUN MAVEN_CONFIG="" ./mvnw package -DskipTests

FROM eclipse-temurin:11-jre-jammy
WORKDIR /app

RUN groupadd --system app && useradd --system --gid app --create-home --home-dir /app app

COPY --from=build /workspace/target/what-time-is-it-0.0.1-jar-with-dependencies.jar /app/what-time-is-it.jar

USER app

EXPOSE 8080

CMD ["java", "-jar", "/app/what-time-is-it.jar"]
