#!/bin/bash

cat >/docker-entrypoint-initdb.d/init-slave.sh  <<'EOF'
#!/bin/bash
echo Updating master connetion info in slave.

mysql -u root -e "RESET MASTER; \
  CHANGE MASTER TO \
  MASTER_HOST='mysql-master', \
  MASTER_PORT=3306, \
  MASTER_USER='$REPLICATION_USER', \
  MASTER_PASSWORD='$REPLICATION_PASSWORD';
"

mysql -u root -e "START SLAVE;"
EOF

exec /entrypoint.sh "$@"