#!/bin/bash

echo >> /etc/gitlab/gitlab.rb <<EOF
gitlab_rails['db_adapter'] = "postgresql"
gitlab_rails['db_encoding'] = "unicode"
gitlab_rails['db_collation'] = nil
gitlab_rails['db_database'] = "${POSTGRES_DB_NAME}"
gitlab_rails['db_pool'] = 10
gitlab_rails['db_username'] = "${POSTGRESQLUSER}"
gitlab_rails['db_password'] = "${POSTGRESQL_PASSWORD}"
gitlab_rails['db_host'] = "${GITLAB_POSTGRES_SERVICE_HOST}"
gitlab_rails['db_port'] = "${GITLAB_POSTGRES_SERVICE_PORT}"
gitlab_rails['db_socket'] = nil
gitlab_rails['db_sslmode'] = nil
gitlab_rails['db_sslrootcert'] = nil
postgresql['enable'] = false
EOF

gitlab-ctl reconfigure
