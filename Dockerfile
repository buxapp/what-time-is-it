FROM bellsoft/liberica-openjdk-debian:25
WORKDIR /work
COPY . /work
RUN ./mvnw package

FROM bellsoft/liberica-openjdk-debian:25
WORKDIR /root/
COPY --from=0 /work/target/what-time-is-it-0.0.1-jar-with-dependencies.jar what-time-is-it.jar
CMD ["java", "-jar", "what-time-is-it.jar"]
