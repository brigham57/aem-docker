# Base image for installing AEM onto
# Uses Centos
# Add Java JDK 8

# use the centos base image
FROM centos
MAINTAINER Mike Brigham, brigham@adobe.com

# Set the specific build of Java you want
ENV JAVA_VERSION 8u31
ENV BUILD_VERSION b112

# Upgrading system
RUN yum -y upgrade
RUN yum -y install wget

# Downloading Java
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm

RUN yum -y install /tmp/jdk-8-linux-x64.rpm

RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

ENV JAVA_HOME /usr/java/latest
