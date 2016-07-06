FROM hezhiyong1992/mvn-tomcat
WORKDIR /usr/src/app
RUN mvn install
RUN cp target/* /usr/local/tomcat/webapps/
RUN rm -rf .
RUN sh /usr/local/tomcat/bin/catalina.sh start
RUN tail -f /usr/local/tomcat/logs/catalina.out