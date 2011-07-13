#!/bin/sh

# leonet認証スクリプト

# filename : leonet_auth.sh
# date     : 21-Jan-2011
# author   : furu

# Input your id & password.
id=
pass=

wget --http-user=${id} --http-password=${pass} http://www.google.co.jp/

rm index.html
echo "index.htmlを削除しました.\n"

echo "認証が完了しました！"
read uho

