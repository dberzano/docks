#!/bin/bash -e
eval $(alienv -q --work-dir /alice/sw printenv aurora/latest cern-get-sso-cookie/latest)
#kinit dberzano@CERN.CH
#cern-get-sso-cookie -r -u https://aliaurora.cern.ch -o ~/.aurora-token || true
cern-get-sso-cookie -r -u https://aliaurora.cern.ch \
                    -o ~/.aurora/auth-token \
                    --cert /usercert.pem \
                    --key /userkey.pem
echo "Authenticated, yay!"
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
cd /home/dberzano/cern-git/ali-marathon/aurora/
exec "$@"
