# About
An example of how you can use nginx reverse proxy, with tls to provide a better local developer experience. 

# Setup
Run `setup.ps1` and input a password for your generated certificate, it will ask you for this password a few time, you'll need to use the same value each time. This will call a few other scripts that will create host entries, generate the trusted root cert, and application certs, and then run the reverse proxy and some example sites via docker compose.
