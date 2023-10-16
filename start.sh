if [ -z "$TOKEN" ]; then
  echo "TOTP token is not set."
else 
  sed -i '$ s/otp=[0-9]\{6\}/otp='"$(oathtool -s 60 --totp $TOKEN)"'/' /etc/openfortivpn/config
fi
openfortivpn
