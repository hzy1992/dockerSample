FROM hezhiyong1992/mvn-tomcat
RUN rm -rf /usr/src/app/*
ADD . /usr/src/app
WORKDIR /usr/src/app
RUN mvn install
RUN cp -rf target/*.war /usr/local/tomcat/webapps/
RUN rm -rf *
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
EXPOSE 8080