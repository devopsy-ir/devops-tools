The Ansible yaml script uses another bash script to create a zip file from all `.env` secret files and then copy it into backup server. To use it, run:
	`ansible-playbook -i ../hosts cronjob.yml`
