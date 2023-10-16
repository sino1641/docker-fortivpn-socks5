#!/bin/sh
/usr/bin/glider -listen :8443 &
echo "http/socks5 proxy server: $(hostname -i):8443"

if [ -z "$TOKEN" ]; then
  echo "TOTP token is not set."
  cp /etc/openfortivpn/config.edit /etc/openfortivpn/config
else 
  cp /etc/openfortivpn/config.edit /etc/openfortivpn/config
  sed -i '$ s/otp=[0-9]\{6\}/otp='"$(oathtool -s 60 --totp $TOKEN)"'/' /etc/openfortivpn/config
fi
cat /etc/openfortivpn/config 
exec "$@"
