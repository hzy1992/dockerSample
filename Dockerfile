FROM hezhiyong1992/mvn-tomcat
WORKDIR /usr/src/app
RUN mvn install
RUN cp -rf target/* /usr/local/tomcat/webapps/
RUN rm -rf *
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
EXPOSE 8080