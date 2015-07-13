FROM centos:centos6
MAINTAINER Kun Yue<KunYue96@gmail.com>

# ##################
# install updates and required tools
# ##################
RUN yum update -y
RUN yum install -y wget
RUN yum install -y tar
RUN yum install -y zip unzip


# ##################
# install Oracle JDK
# ##################
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
RUN rpm -ivh jdk-8u45-linux-x64.rpm && rm jdk-8u45-linux-x64.rpm
