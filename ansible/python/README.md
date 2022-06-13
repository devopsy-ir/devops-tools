Install Python using ansible module `raw` since any other ansible module, such as `apt`, needs python installed:
	`ansible-playbook -i hosts.yml -u root python.yml`
After this, you must use python3 instead of python2:
	`---`
	`#vars`
	  `ansible_python_interpreter: /usr/bin/python3`
