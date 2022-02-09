To operate on the bitbucket server, such as: Backup, Restore, do this:

[Backup]
Steps:
1. `docker-compose up -d bitbucket-backup`
2. Copy generated backup file from directory `./volumes/backup/bitbucket` into anywhere you want.

[Restore]
Steps:
1. Run container PostgreSQL: `docker-compose up -d postgres`
2. Make an empty directory for Bitbucket home to be filled in with backup files: `mkdir ./volumes/bitbucket`
3. Change backup file name in file `.env` to the file you want to restore bitbucket and it's postgresql database from.
4. Restore backup file by running container bitbucket restore: `docker-compose up -d bitbucket-restore`
5. Run bitbucket: `docker-compose up -d bitbucket`
