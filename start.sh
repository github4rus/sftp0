#!/bin/sh
for t in dsa ecdsa ed25519 rsa rsa1; do
  if ! [ -e "/etc/ssh/ssh_host_${t}_key" ]; then
    ssh-keygen -f "/etc/ssh/ssh_host_${t}_key" -t ${t} -N ""
  fi
done
PASS=${PASS:-p@zzw0rd}
(echo ${PASS};echo ${PASS}) | passwd
/usr/sbin/sshd -D
