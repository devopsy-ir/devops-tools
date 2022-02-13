cd /root/infra/services/crowd && \

sha1sum /root/infra/services/crowd/volumes/data/crowd/shared/backups/atlassian-crowd-$(date +%Y-%m-%d)-020000-automated-backup-3.3.2.xml > /root/infra/services/crowd/volumes/data/crowd/shared/backups/atlassian-crowd-$(date +%Y-%m-%d)-020000-automated-backup-3.3.2.sha1 && \

/usr/bin/rsync -e "ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=30" --timeout=48000  -azhvPW --inplace  --progress  --size-only /root/infra/services/crowd/volumes/data/crowd/shared/backups root@173.45.80.74:/root/backup/crowd >/root/infra/services/crowd/files/backup.out 2>&1 && \

find /root/infra/services/crowd/volumes/data/crowd/shared/backups/*.xml -maxdepth 1 -mtime +5 -type f -delete && \

find /root/infra/services/crowd/volumes/data/crowd/shared/backups/*.sha1 -maxdepth 1 -mtime +5 -type f -delete;
