#!/bin/sh

# レオネット認証スクリプト(improved)

# filename : leonet_auth_improved.sh
# date     : 5-November-2011
# author   : furu


# Input your id & password.
ID=
PASS=
SERVER="www.google.co.jp"
PETTERN="^HTTP/1.1 200 OK"

tmplogfile=$(mktemp /tmp/leonet_auth_tmp.XXXXXX) || exit 1

curl -I ${SERVER} > $tmplogfile 2> /dev/null

grep "${PETTERN}" $tmplogfile > /dev/null 2>&1
if [ ${?} -eq 0 ]; then
    echo "${SERVER} -> OK"
    echo "Authentication has been done."
else
    echo "${SERVER} -> NG"
    echo "Start authentication ..."
    curl -o index.html -u ${ID}:${PASS} ${SERVER}/ 2> /dev/null
    rm index.html
    echo "Authentication was completed!"
fi
