# alisw/slc6-builder:v15

FROM alisw/slc6-builder

ADD https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel6.repo \
    /etc/yum.repos.d/htcondor.repo
RUN rpm --import http://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor

RUN yum clean all && \
    rpmdb --rebuilddb && \
    yum update -y && \
    yum install -y condor && \
    yum clean all
