#!/bin/bash

DATABASE_SERVICE_HOST=`echo "${DATABASE_SERVICE_NAME}_SERVICE_HOST" | tr "[:lower:]" "[:upper:]"`
DATABASE_SERVICE_PORT=`echo "${DATABASE_SERVICE_NAME}_SERVICE_PORT" | tr "[:lower:]" "[:upper:]"`

echo >> /etc/gitlab/gitlab.rb <<EOF
gitlab_rails['db_adapter'] = "postgresql"
gitlab_rails['db_encoding'] = "unicode"
gitlab_rails['db_collation'] = nil
gitlab_rails['db_database'] = "${POSTGRESQL_DATABASE}"
gitlab_rails['db_pool'] = 10
gitlab_rails['db_username'] = "${POSTGRESQL_USER}"
gitlab_rails['db_password'] = "${POSTGRESQL_PASSWORD}"
gitlab_rails['db_host'] = "${DATABASE_SERVICE_HOST}"
gitlab_rails['db_port'] = "${DATABASE_SERVICE_PORT}"
gitlab_rails['db_socket'] = nil
gitlab_rails['db_sslmode'] = nil
gitlab_rails['db_sslrootcert'] = nil
postgresql['enable'] = false
EOF

gitlab-ctl reconfigure
