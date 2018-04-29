# Recommended configuration for an O2 CC7 container
# https://alice-doc.github.io/alice-analysis-tutorial/building/prereq-centos7.html
FROM centos:7
RUN rpmdb --rebuilddb && yum clean all && \
    yum install -y git python mysql-devel curl curl-devel python python-devel python-pip bzip2 bzip2-devel autoconf automake texinfo gettext gettext-devel libtool freetype freetype-devel libpng libpng-devel sqlite sqlite-devel ncurses-devel mesa-libGLU-devel libX11-devel libXpm-devel libXext-devel libXft-devel libxml2 libxml2-devel motif motif-devel kernel-devel pciutils-devel kmod-devel bison flex perl-ExtUtils-Embed environment-modules && \
    curl -o /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py && python /tmp/get-pip.py && rm -f /tmp/get-pip.py && \
    pip install matplotlib==2.0.2 numpy certifi ipython==5.1.0 ipywidgets ipykernel notebook metakernel pyyaml && \
    yum install -y centos-release-scl && \
    yum-config-manager --enable rhel-server-rhscl-7-rpms && \
    yum install -y devtoolset-6 && \
    yum install -y vim-enhanced emacs-nox && \
    rpmdb --rebuilddb && yum clean all && \
    pip install alibuild
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
CMD [ "/bin/bash" ]
