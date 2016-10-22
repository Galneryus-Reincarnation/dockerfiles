FROM galneryus/alpine-jdk:latest

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

# http://s3ninja.net/
#WORKDIR     "/opt/dynamodb"
#EXPOSE      8000
## -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -port 8000 -inMemory
#CMD         ["java", "-Xmx1g", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-port", "8000", "-inMemory"]

