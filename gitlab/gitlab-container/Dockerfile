FROM gitlab:gitlab-ce
MAINTAINER jcordes@redhat.com

EXPOSE 22/tcp 80/tcp 443/tcp

WORKDIR ${GITLAB_INSTALL_DIR}
ENTRYPOINT ["/scripts/configure-postgres.sh"]
