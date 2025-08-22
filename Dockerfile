FROM openjdk:24-jdk-slim AS base

# Cài wget + tar
RUN apt-get update && apt-get install -y wget tar && rm -rf /var/lib/apt/lists/*

# Cài Tomcat 10.1.44
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.44/bin/apache-tomcat-10.1.44.tar.gz \
    && tar xzf apache-tomcat-10.1.44.tar.gz \
    && mv apache-tomcat-10.1.44 /usr/local/tomcat \
    && rm apache-tomcat-10.1.44.tar.gz

ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH="$CATALINA_HOME/bin:$PATH"

# Copy war vào Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY EmailList.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
