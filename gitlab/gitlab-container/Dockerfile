FROM rhel:rhel7
MAINTAINER jcordes@redhat.com

ENV GITLAB_VERSION=8.8.0 \
    GITLAB_HOME="/home/git" \
    GITLAB_LOG_DIR="/var/log/gitlab" \
    RAILS_ENV=production

ENV GITLAB_INSTALL_DIR="${GITLAB_HOME}/gitlab" \
    GITLAB_DATA_DIR="${GITLAB_HOME}/data" \
    GITLAB_RUNTIME_DIR="${GITLAB_CACHE_DIR}/runtime"

RUN yum -y install https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm && \
curl -LJO https://packages.gitlab.com/gitlab/gitlab-ce/packages/el/7/gitlab-ce-${GITLAB_VERSION}-ce.0.el7.x86_64.rpm/download && \
rpm -i gitlab-ce-${GITLAB_VERSION}-ce.0.el7.x86_64.rpm && \
yum install -y gitlab-ce

EXPOSE 22/tcp 80/tcp 443/tcp

VOLUME ["${GITLAB_DATA_DIR}", "${GITLAB_LOG_DIR}"]
WORKDIR ${GITLAB_INSTALL_DIR}
ENTRYPOINT ["/scripts/configure-postgres.sh"]
