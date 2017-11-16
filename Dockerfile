FROM alpine
RUN apk add --update openssh
RUN sed -iE 's/^\#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
	&& mkdir /data \
	&& echo -e "Match User root\n\tX11Forwarding no\n\tAllowTcpForwarding no\n\tForceCommand internal-sftp\n\tChrootDirectory /data" >> /etc/ssh/sshd_config
RUN	cp /etc/ssh /etc/bak.ssh

ADD start.sh /usr/sbin/start.sh
CMD ["/usr/sbin/start.sh"]
