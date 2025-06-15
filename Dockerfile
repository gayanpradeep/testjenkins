# FROM openjdk
# COPY sample.java .
# RUN javac sample.java
# CMD ["java", "sample"]

FROM openjdk:17
WORKDIR /app
COPY HelloWorld.java .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
