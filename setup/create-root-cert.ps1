New-Item -ItemType Directory -Force -Path ./certs

$env:Path += ";C:\Program Files\Git\usr\bin"; #openssl is included in git for windows

openssl genrsa -des3 -out ./certs/root-ca.key 2048
openssl req -x509 -new -nodes -key ./certs/root-ca.key -sha256 -days 1825 -out ./certs/root-ca.pem -subj "/C=GB/ST=Somewhere/L=Somewhere/O=Someone/OU=IT/CN=*.my-website.com"

Import-Certificate -FilePath ./certs/root-ca.pem -CertStoreLocation Cert:\LocalMachine\Root