
# docker-compose exec moodle bash

root@moodle# cd bitnami/moodle

root@moodle# /opt/bitnami/php/bin/php admin/cli/maintenance.php --enable

root@moodle# /opt/bitnami/php/bin/php admin/cli/reset_password.php

root@moodle# /opt/bitnami/php/bin/php admin/cli/maintenance.php --disable
