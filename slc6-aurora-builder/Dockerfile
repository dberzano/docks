FROM alisw/slc6-builder

# Upgrade glibc
RUN mkdir /glibc                                            && \
    cd /glibc                                               && \
    curl -LO http://ftp.gnu.org/gnu/glibc/glibc-2.14.tar.gz && \
    tar zxvf glibc-2.14.tar.gz                              && \
    cd glibc-2.14                                           && \
    mkdir build                                             && \
    cd build                                                && \
    ../configure --prefix=/opt/glibc-2.14                   && \
    make -j10                                               && \
    make install                                            && \
    cd /                                                    && \
    rm -rf /glibc
ENV PATH=/opt/glibc-2.14/sbin:/opt/glibc-2.14/bin${PATH:+:${PATH}}
ENV LD_LIBRARY_PATH=/opt/glibc-2.14/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Enable Python 2.7 from SCL (not the default Python though!)
ENV PATH=${PATH:+${PATH}:}/opt/rh/python27/root/usr/bin
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/opt/rh/python27/root/usr/lib64
ENV MANPATH=${MANPATH}:/opt/rh/python27/root/usr/share/man
ENV XDG_DATA_DIRS=${XDG_DATA_DIRS:-/usr/local/share:/usr/share}:/opt/rh/python27/root/usr/share
ENV PKG_CONFIG_PATH=${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/opt/rh/python27/root/usr/lib64/pkgconfig

# Bad
RUN ln -nfs libsasl2.so.2 /usr/lib64/libsasl2.so.3
