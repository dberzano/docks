#!/bin/bash -e
cd "$(dirname "$0")"
[[ -e usercert.pem ]] || cp ~/.globus/usercert.pem .
[[ -e userkey.pem ]] || openssl rsa -in ~/.globus/userkey.pem -out userkey.pem
chmod 0400 user*.pem
[[ "$1" != --rebuild ]] || { shift; docker build . -t aurora-client; }
touch aurora-history
docker run -it --rm \
           -v $HOME:$HOME:ro \
           -v $PWD/manage.sh:/manage.sh:ro \
           -v $PWD/usercert.pem:/usercert.pem:ro \
           -v $PWD/userkey.pem:/userkey.pem:ro \
           -v $PWD/aurora-history:/root/.bash_history:rw \
           aurora-client "$@"
