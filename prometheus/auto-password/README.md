To run:
1. Generate Prometheus web config file (web.yml) which contains hashed password cleared in file '.env'
	/bin/bash run.sh

2. Note into added line of file `docker-compose.yml`:
	prometheus:
	  volumes:	
	    - '--web.config.file=/etc/prometheus/web.yml'

Run:
	docker-compose up -d
