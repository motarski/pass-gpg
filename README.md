### Create GPG key-pair


```
$ gpg --full-gen-key
# Use user ID ivan.thegreat@macbook.com
```

### Create and encrypt *(sign)* file with generated key

- SCENARIO: Person 1 is you. You generated key pairs. You gave your public key to Person 2. To encrypt (sign) something Person 1 (you) must use secret key (private key) for encryption. That way person 2 can decrypt your message with your public key. Same goes for opposite.

```
$ echo "This is secret" > secret.txt
$ gpg --sign secret.txt
```

### Decrypt gpg encrypted file

```
$ gpg -d secret.txt.gpg > decrypted.txt
```

### Install pass and bash completion. Initialize password-store with gpg key user ID

```
$ brew install pass
$ echo "source /usr/local/etc/bash_completion.d/pass" >> ~/.bash_profile
$ pass init ivan.thegreat@macbook.com
```

### Insert pass record into password store

```
$ pass insert github/login
# Enter password for login
```

### List and editrecords in password store

```
$ pass
$ pass edit github/login
```

### Set git upstream and push git changes via pass

 ```
 $ git branch --set-upstream-to=origin/master master
 $ pass git pull
 $ pass git push
 ```

### Change default pass editor
```
$ export EDITOR="vim"
```

### Exporting and deleting Public and secret key (Backup)

```
$ gpg --export ivan.thegreat@macbook.com > publicKey.asc
$ gpg --export-secret-keys ivan.thegreat@macbook.com > secretKey.asc

---Deleting Keys---

$ gpg --delete-secret-keys ivan.thegreat@macbook.com
$ gpg --delete-keys ivan.thegreat@macbook.com
```

### Importing Public and Secret keys (Restore from backup)
```
$ gpg --import publicKey.asc
$ gpg --import secretKey.asc
```

# Generate Certificates *(CA and Client Certificates)*

- CA Cert, Certifiate request and Signing the certificate
```
$ openssl genrsa -out ca.key 2048  # Generate Certifate Authority Private Key
$ openssl req -new -key ca.key -subj "/CN=IVAN-CA" -out ca.csr   # Generate Certificate Signing request
$ openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt   # Sign the certificate with ca.key
```

- Client Certificate (admin user)

NOTE: To distiungish that the user is Admin user with admin privileges in kuberentes an OU with the "system.masters" MUST be added.

```
$ openssl genrsa -out admin.key 2048
$ openssl req -new -key admin.key -subj "/CN=admin-user/O=system.masters" -out admin.csr   # Client with authenticate with name "admin-user"
$ openssl x509 -req -in admin.csr -signkey ca.key -out admin.crt   # Sign the client certificate with the ca.key
```
