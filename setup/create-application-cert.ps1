New-Item -ItemType Directory -Force -Path ./docker/certs

$domains = @("*.my-website.com", "my-website.com");

# Generate certs for the above domains, signing them with our own root cert

$certExtFile = "./certs/certificate.ext"
$dockerCertPath = "./docker/certs"
$rootCaPath = "./certs";

$env:Path += ";C:\Program Files\Git\usr\bin"; #openssl is included in git for windows

foreach($domain in $domains)
{
    $domainFile = $domain.Replace("*", "");

    openssl genrsa -out "$dockerCertPath/$domainFile.key" 2048;
    openssl req -new -key "$dockerCertPath/$domainFile.key" -out "$dockerCertPath/$domainFile.csr" -subj "/C=GB/ST=Somewhere/L=Somewhere/O=Someone/OU=IT/CN=$domain";
    openssl x509 -req -in "$dockerCertPath/$domainFile.csr" -CA "$rootCaPath/root-ca.pem" -CAkey "$rootCaPath/root-ca.key" -CAcreateserial -out "$dockerCertPath/$domainFile.crt" -days 825 -sha256 -extfile $certExtFile;
}