FROM ubuntu:14.04 
# Update Ubuntu
RUN apt-get update && apt-get -y upgrade

# Add oracle java 8 repository
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update

# Accept the Oracle Java license
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

# Install Oracle Java
RUN apt-get -y install oracle-java8-installer

#RUN export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# Install tomcat
RUN apt-get -y install tomcat7
RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/default/tomcat7

RUN mkdir /usr/share/tomcat7/logs

EXPOSE 8080
EXPOSE 8009
# Download Slashdot homepage
RUN mkdir /var/lib/tomcat7/webapps/slashdot

RUN wget http://www.slashdot.org -P /var/lib/tomcat7/webapps/slashdot
# Start Tomcat, after starting Tomcat the container will stop. So use a 'trick' to keep it running.
#CMD service tomcat7 start && tail -f /var/lib/tomcat7/logs/catalina.out
#CMD "/usr/share/tomcat7/bin/startup.sh"
