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
