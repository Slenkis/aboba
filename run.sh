#!/bin/bash

set -euo pipefail

IFS= read -r password < passwd.txt
IFS= read -r url < url.txt

echo '############################'
echo $'pass:\t'"${password}"
echo $'URL:\t\t'"${url}"
echo 'QR codein files.'
echo '############################'

exec go-shadowsocks2 -s 'ss://AEAD_CHACHA20_POLY1305:'"${password}"'@:8488' -verbose -plugin v2ray-plugin -plugin-opts "server" -udp=false