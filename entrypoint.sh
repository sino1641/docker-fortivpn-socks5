#!/bin/sh
/usr/bin/glider -listen :8443 &
echo "http/socks5 proxy server: $(hostname -i):8443"
if [ -z "$TOKEN" ]; then
  echo "TOTP token is not set."
else 
  sed -i '$ s/otp=[0-9]\{6\}/otp='"$(oathtool -s 60 --totp $TOKEN)"'/' /etc/openfortivpn/config
fi

exec "openfortivpn"
