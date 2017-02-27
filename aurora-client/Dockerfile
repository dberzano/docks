FROM ubuntu:16.10
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y build-essential \
                       python-pip \
                       git \
                       curl \
                       openjdk-8-jdk \
                       wget \
                       libcurl4-openssl-dev \
                       libkrb5-dev \
                       krb5-user \
                       environment-modules \
                       libssl-dev && \
    pip install alibuild
#aliBuild --dist IB/v5-08/prod init && ( cd alidist && git reset --hard e4c242aee096483dc31c4877588c67ea2e2b17d0 ) && \
RUN mkdir /alice && cd /alice && \
    aliBuild init aurora,cern-get-sso-cookie && \
    grep -v aurora_admin.pex alidist/aurora.sh > alidist/aurora0.sh && mv alidist/aurora0.sh alidist/aurora.sh && \
    sed -i -e 's/.*cpanmin.*/\0 URI::Escape HTML::Entities/' alidist/cern-get-sso-cookie.sh && \
    ( cd alidist && git diff ) && \
    sed -i -e 's/if (!defined($key)) {/if (defined($key)) {/' cern-get-sso-cookie/cern-get-sso-cookie/usr/share/perl5/WWW/CERNSSO/Auth.pm
RUN curl https://cafiles.cern.ch/cafiles/certificates/CERN%20Grid%20Certification%20Authority.crt > /usr/local/share/ca-certificates/cern_grid.crt && \
    curl https://cafiles.cern.ch/cafiles/certificates/CERN%20Root%20Certification%20Authority%202.crt > /cern_root.crt && \
    openssl x509 -in /cern_root.crt -inform der -out /usr/local/share/ca-certificates/cern_root.crt -outform pem && \
    rm -f /cern_root.crt && \
    update-ca-certificates
RUN cd /alice && \
    aliBuild --debug build aurora && \
    aliBuild --debug build cern-get-sso-cookie
ADD aurora-config.json /root/.aurora/clusters.json
ADD entrypoint.sh /entrypoint.sh
CMD ["/bin/bash"]
ENTRYPOINT ["/entrypoint.sh"]
