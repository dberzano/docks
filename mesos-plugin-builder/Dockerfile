FROM centos:centos6

RUN yum clean all && \
    yum update -y && \
    yum install -y rsync \
                   openssl-clients \
                   which && \
    yum clean all && \
    rpm -Uvh http://repos.mesosphere.io/el/6/noarch/RPMS/mesosphere-el-repo-6-2.noarch.rpm && \
    yum install -y mesos \
                   git \
                   java-1.7.0-openjdk-devel && \
    yum clean all

RUN curl -L http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo > /etc/yum.repos.d/epel-apache-maven.repo && \
    yum install -y apache-maven && \
    yum clean all

ENV MESOS_PLUGIN_VERSION mesos-0.8.0
RUN git clone -b $MESOS_PLUGIN_VERSION https://github.com/jenkinsci/mesos-plugin.git && \
    cd mesos-plugin && \
    mvn package
