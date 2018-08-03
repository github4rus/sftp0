# sftp0

sftp0 is a sftp server with root user access.
  - default password is set to p@zzw0rd
  - only sftp subsystem is available

# usage:
```sh
docker run -d --name sftp0 -e PASS=<rootpassword> \
-v /shared/folder:/data/share \
-p 20002:22 dockerapp/sftp0
```

