Steps:
1. Build the crowd image by changing the version in file `.env`.
Not to forget to copy `.env.example` into `.env` before!

	cp .env.example .env
	sed -e 's/^CROWD_VERSION=.*$/CROWD_VERSION=3.3.2/g' .env -i	
	docker-compose build

Export (Copy) the jar file `atlassian-extras-3.2.jar` from Crowd docker image by:
	`docker run --rm --name crowd  -d crowd:3.3.2`
	`docker cp crowd:/app/crowd/crowd-webapp/WEB-INF/lib/atlassian-extras-3.2.jar ./files/`
        `docker stop crowd`
	The container will be removed automatically since it started with: `--rm` above!

Generate another jar:
	`java -jar ./files/crowd.jar`
	`mv ./files/atlassian-extras-3.2.jar ./files/atlassian-extras-2.6.jar`
	Click second button and then select jar file `atlassian-extras-2.6.jar` to generate another jar.
	This file is mounted into the container by:
		`services:
		  crowd:
		    volumes:
		      - ./files/atlassian-extras-2.6.jar:/app/crowd/crowd-webapp/WEB-INF/lib/atlassian-extras-3.2.jar`
Run it:
	`docker-compose up -d`
