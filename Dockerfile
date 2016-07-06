FROM hezhiyong1992/mvn-tomcat
WORKDIR /usr/src/app
RUN mvn install
RUN cp -rf target/* /usr/local/tomcat/webapps/
RUN rm -rf *
CMD ["sh","/usr/local/tomcat/bin/catalina.sh","start","|","tail","-f","/usr/local/tomcat/logs/catalina.out"]
EXPOSE 8080