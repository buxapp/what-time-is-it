FROM eclipse-temurin:25-jdk-alpine AS builder
WORKDIR /work
COPY . /work
RUN ./mvnw package

FROM eclipse-temurin:25-jre-alpine
WORKDIR /root/
COPY --from=builder /work/target/what-time-is-it-0.0.1-jar-with-dependencies.jar what-time-is-it.jar
CMD ["java", "-jar", "what-time-is-it.jar"]