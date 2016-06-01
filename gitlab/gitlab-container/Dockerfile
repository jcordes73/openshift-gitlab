FROM gitlab:gitlab-ce
MAINTAINER jcordes@redhat.com

EXPOSE 22/tcp 80/tcp 443/tcp

COPY scripts/configure-postgres.sh /usr/local/bin/configure-postgres.sh
RUN chmod 755 /usr/local/bin/configure-postgres.sh

VOLUME ["/var/opt/gitlab","/var/log/gitlab","/etc/gitlab"]

CMD ["/usr/local/bin/configure-postgres.sh"]
CMD ["/etc/init.d/gitlab","restart"]
