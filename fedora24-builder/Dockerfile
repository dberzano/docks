FROM fedora:24
RUN dnf install -y python && dnf group install -y "Development Tools" && dnf clean all && pip install argparse && pip install PyYAML
RUN dnf install -y libtermcap-devel && dnf install -y bison
RUN dnf install -y gcc-c++ which flex
RUN dnf install -y tar
RUN dnf install -y perl-Data-Dumper
RUN dnf install -y perl-Thread-Queue
RUN dnf install -y htop procps-ng environment-modules
