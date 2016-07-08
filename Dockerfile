FROM maven:3.2-jdk-7
add http://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.2.17.v20160517/jetty-distribution-9.2.17.v20160517.tar.gz /usr/jetty
#RUN tar -zxf jetty-distribution-9.2.17.v20160517.tar.gz
#RUN rm -rf jetty-distribution-9.2.17.v20160517.tar.gz
#RUN mv jetty-distribution-9.2.17.v20160517 /usr/jetty
RUN mkdir -p /usr/src/app
add . /usr/src/app
WORKDIR /usr/src/app
RUN mvn install
RUN ls /usr/jetty
RUN cp target/*.war /usr/jetty/webapps/
WORKDIR /usr/src
RUN rm -rf *
WORKDIR /usr/jetty
CMD ["java","-jar","start.jar"]
