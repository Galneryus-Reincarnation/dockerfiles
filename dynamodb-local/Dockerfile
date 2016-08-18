FROM galneryus/alpine-jdk:latest

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

# http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html
WORKDIR     "/opt/dynamodb"
EXPOSE      8000
ENTRYPOINT  ["java"]
# -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -port 8000 -inMemory
CMD         ["-Xmx1g", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-port", "8000", "-inMemory"]

