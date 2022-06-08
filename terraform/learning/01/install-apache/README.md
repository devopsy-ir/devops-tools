Install apache2 service on target host wither by:
Ansible:
	`ansible-playbook -i hosts.yml -u root apache.yml`

Ad hoc script:
	`scp apache.sh root@target:~/`
	SSH into the target hostand then:
		`target# /bin/bash ~/apache.sh`
