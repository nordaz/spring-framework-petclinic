#FROM bitnami/tomcat:9.0
FROM  tomcat:9-jdk17-corretto-al2

COPY *.war   /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]
