#!/bin/bash

# 1. Generate Certificate Authority Private key ca.key
# 2. Generate Certificate Signing request
# 3. Sign the certificate with the ca.key

openssl genrsa -out ca.key 2048
openssl req -new -key ca.key -subj "/CN=IVAN-CA" -out ca.csr
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt

# Client Certificate (admin-user)
# 1. Generate Certificate Authority Private key admin.key
# 2. Generate Certificate Signing request
# 3. Sign the client certificate with the ca.key
# NOTE: To distiungish that the user is Admin user with admin privileges in kuberentes
# anOU with the "system.masters" MUST be added.

openssl genrsa -out admin.key 2048
openssl req -new -key admin.key -subj "/CN=admin-user/O=system.masters" -out admin.csr
openssl x509 -req -in admin.csr -signkey ca.key -out admin.crt
