# The FROM instruction sets the Base Image for subsequent instructions.
# Using Nginx as Base Image
FROM maven:3.2-jdk-7
RUN wget http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.2.17.v20160517/jetty-distribution-9.2.17.v20160517.tar.gz 
RUN tar -zxf jetty-distribution-9.2.17.v20160517.tar.gz
RUN rm -rf jetty-distribution-9.2.17.v20160517.tar.gz
RUN mv jetty-distribution-9.2.17.v20160517 /usr/jetty
ONBUILD add . /usr/src/app
ONBUILD WORKDIR /usr/src/app
ONBUILD RUN mvn install
ONBUILD RUN cp target/*.war /usr/jetty/webapps
ONBUILD WORKDIR /usr/jetty/webapps
ONBUILD rm -rf /usr/src/app
EXPOSE 8080
CMD ["java","-jar","jetty/start.jar"]



