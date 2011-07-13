#!/bin/sh

# leonet認証スクリプト(improved)

# filename : leonet_auth_improved.sh
# date     : 8-April-2011
# author   : furu


# Input your id & password.
ID=
PASS=
SERVER="www.google.co.jp"
PETTERN="^HTTP/1.1 200 OK"

# mktemp -t : /tmp/ 以下にtmp.XXXXXXXXXXを作成
# 下のじゃ動かない。tmplogfileには'mktep -t tmp.XXXXXXXXXX'が文字列で入る。
# tmplogfile='mktemp -t tmp.XXXXXXXXXX' || exit 1
touch tmp

# get http header for $SERVER
curl -I ${SERVER} > tmp 2> /dev/null

grep "${PETTERN}" tmp > /dev/null 2>&1
if [ ${?} -eq 0 ]
then
    echo "${SERVER} -> OK\n"
    echo "Authentication has been done.\n"
else
    echo "${SERVER} -> NG\n"
    echo "start authentication ..."
    wget --http-user=${ID} --http-password=${PASS} http://www.google.co.jp/ 2> /dev/null
    rm index.html
    echo "Authentication was completed!\n"
fi

rm tmp

# Wait.
read uho
