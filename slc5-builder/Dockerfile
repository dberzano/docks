FROM centos:5
COPY mock-uname-slc5.sh /bin/uname
COPY mock-redhat-release-slc5.txt /etc/redhat-release
ADD https://releases.hashicorp.com/vault/0.5.0/vault_0.5.0_linux_amd64.zip /vault.zip
RUN cd /                                                                                                                               && \
    rm -f /var/lib/rpm/Pubkeys                                                                                                         && \
    rpmdb --rebuilddb && yum clean all                                                                                                 && \
    yum install -y curl                                                                                                                && \
    curl -LO http://repository.it4i.cz/mirrors/repoforge/redhat/el5/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm && \
    curl -LO https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm                                                    && \
    rpm -ihv rpmforge*rpm                                                                                                              && \
    rpm -ihv epel*rpm                                                                                                                  && \
    rm -f *.rpm                                                                                                                        && \
    yum install -y autoconf automake bison bzip2 bzip2-devel curl curl-devel doxygen                                                      \
                   environment-modules expat expat-devel file flex gcc-c++ gcc-gfortran gdb git                                           \
                   glibc-devel.i686 glibc-devel.x86_64 gmp gmp-devel install java-1.7.0-openjdk                                           \
                   libaio libaio-devel libgcc.i686 libgcc.x86_64 libtermcap-devel libtool                                                 \
                   libX11-devel libXext-devel libXft-devel libxml2-devel libXpm-devel make                                                \
                   mesa-libGLU-devel mysql-devel ncurses-devel openssl-devel python-devel                                                 \
                   python-hashlib python-setuptools python-yaml redhat-lsb subversion tcl texinfo                                         \
                   unzip valgrind vim-enhanced wget which zip zlib-devel                                                               && \
    cd / && unzip vault.zip && mv ./vault /usr/bin/vault && rm -f vault.zip                                                            && \
    yum install -y python26                                                                                                            && \
    ln -s /usr/bin/python2.6 /usr/local/bin/python                                                                                     && \
    curl https://bootstrap.pypa.io/get-pip.py | python                                                                                 && \
    pip install bernhard                                                                                                               && \
    pip install pyyaml                                                                                                                 && \
    easy_install argparse                                                                                                              && \
    rpmdb --rebuilddb && yum clean all                                                                                                 && \
    which python2.6 && which vault
