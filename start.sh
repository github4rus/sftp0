#!/bin/sh
for t in dsa ecdsa ed25519 rsa; do
  if ! [ -f "/etc/ssh/ssh_host_${t}_key" ]; then
    ssh-keygen -f "/etc/ssh/ssh_host_${t}_key" -t ${t} -N ""
  fi
done
if ! [ -f "/etc/ssh/sshd_config" ]; then cp /etc/bak.ssh/sshd_config /etc/ssh/; fi
if ! [ -d "/etc/ssh/moduli" ]; then cp /etc/bak.ssh/moduli /etc/ssh/; fi

PASS=${PASS:-p@zzw0rd}
(echo ${PASS};echo ${PASS}) | passwd
/usr/sbin/sshd -D ${SSHD_OPTS}
