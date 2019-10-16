### Create GPG key-pair


```
$ gpg --full-gen-key
# Use user ID ivan.thegreat@macbook.com
```

### Create and encrypt file with generated key

```
$ echo "This is secret" > secret.txt
$ gpg -r ivan.thegreat@macbook.com -e secret.txt
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
# Will open editor
```

### Change default pass editor
```
$ export EDITOR="vim"
```
