cd /root/infra/services/bitbucket && \

/usr/local/bin/docker-compose up -d  bitbucket-backup >/root/infra/services/bitbucket/files/backup.out 2>&1 && \

sha1sum ./volumes/backup/bitbucket/bitbucket-$(date +%Y%m%d)-*.tar > ./volumes/backup/bitbucket/bitbucket-$(date +%Y%m%d).sha1 && \

/usr/bin/rsync -vatP --size-only --progress -rsh=ssh /root/infra/services/bitbucket/volumes/backup/bitbucket root@173.45.80.74:/root/backup/ >/root/infra/services/bitbucket/files/backup.out 2>&1 && \

find /root/infra/services/bitbucket/volumes/backup/bitbucket/*.tar -maxdepth 1 -mtime +7 -type f -delete;
